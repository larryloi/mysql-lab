(# MySQL Replication Deployment

This directory provides a Docker-based replication setup for MySQL used by the mysql-lab project. It contains compose files and configuration for a primary (source) and one or more replicas (targets). The goal is to make it easy to spin up a local replication environment for testing and experimentation.

## What this contains

- Docker Compose manifests for primary and replica instances (versioned by MySQL release in subfolders).
- Example `primary.cnf` and `replica.cnf` MySQL configuration fragments.
- Makefile targets to build and run the topology where present.

## Prerequisites

- Docker (20.x+) and Docker Compose (v2 recommended) installed and working.
- Make (optional, for convenience targets).
- Enough disk and memory to run multiple MySQL containers (suggest 2–4 GB RAM available).

## Quick start

Deployment files (docker-compose, Makefile, and configs) now live directly under `deploy/replication`.

Use the Makefile or the docker-compose files in this directory to bring up the primary and replica services. Typical steps (run from repository root):

```bash
# bring up the primary and replicas using the compose files in deploy/replication
cd deploy/replication

# if a Makefile target exists, you can use it (convenience wrapper)
make up      # optional - depends on the Makefile in this directory

# or use docker compose directly (examples below assume compose files are named appropriately)
docker compose -f docker-compose.yml up -d primary   # starts the primary
docker compose -f docker-compose.yml up -d replica   # starts the replica(s)

# to bring everything up with a single compose file (if provided)
docker compose up -d
```

If your repository uses differently named compose files, substitute their names in the `-f` flags. Use `docker compose ps` and `docker compose logs -f` to inspect services.

## Configuration files

- `primary.cnf` — configuration for the primary, sets server-id, binary logging options and other replication-relevant settings.
- `replica.cnf` — configuration for a replica, sets a unique server-id and configures relay log and replication behavior.

Configuration files for the replication setup live under `deploy/replication/conf` — review the files there (for example `primary.cnf`, `replica.cnf`) if you need to change `server-id`, binlog format, or other settings.

If you maintain additional MySQL fragments, place them in `deploy/replication/conf` so the Docker setup can pick them up.

## Typical workflow and useful commands

- View container logs:

```bash
docker compose -f deploy/replication/docker-compose.yml logs -f
```

- Enter a MySQL primary container and inspect replication status:

```bash
docker exec -it <primary-container-name> mysql -uroot -p
# inside mysql client:
SHOW MASTER STATUS\G
SHOW SLAVE HOSTS;   -- on primary (optional)
```

- On a replica, check status:

```sql
-- inside replica mysql client:
SHOW SLAVE STATUS\G
-- or (MySQL 8+):
SELECT * FROM performance_schema.replication_connection_status;
```

### Create replication users on the primary (Makefile)

There is a convenience Makefile target to create the replication login on the primary node. From the repository root run:

```bash
make -C deploy/replication mysql.create.repl.login
```

After replication login created, and the below binary log information will show. according to the provided information, run start replication command on replica node to complete the setup

```bash

root@dev01:/docker/mysql-lab/deploy/mysql-repl# make mysql.create.repl.login
Creating MySQL Replication user login...
docker exec -i mysql-repl_node-1 mysql -uroot -prootpass < ../sql/acl_repl_login_primary.sql
mysql: [Warning] Using a password on the command line interface can be insecure.
File    Position        Binlog_Do_DB    Binlog_Ignore_DB        Executed_Gtid_Set
mysql-bin.000003        12963
```

This target executes the SQL script `acl_repl_login_primary.sql` inside the primary container (via `docker exec`) and creates the `replica_user` with the necessary REPLICATION privileges.

Run this before configuring the replica to connect to the primary.

## Initialization and example data

Some subfolders include initialization SQL under `initdb.d/` or `db/init` — those are applied on container creation by the official MySQL images. If you need deterministic data for tests, add files to `initdb.d/` in the appropriate folder.

## Final step — start replication on the replica

Once the primary is up and the replication user exists (created via the Makefile target above), run the following on the replica MySQL client (replace host, user, password, binlog file and position with values from your environment):

```sql
CHANGE REPLICATION SOURCE TO
	SOURCE_HOST='dev01.kaskade.local',
	SOURCE_USER='replica_user',
	SOURCE_PASSWORD='replica_pass',
	SOURCE_LOG_FILE='mysql-bin.000003',
	SOURCE_LOG_POS=880,
	SOURCE_CONNECTION_AUTO_FAILOVER=0,
	GET_SOURCE_PUBLIC_KEY=1;

START REPLICA;
```

You should see "Query OK" responses and then `SHOW REPLICA STATUS\G` (or `SHOW SLAVE STATUS\G` on older MySQL) on the replica to verify it is applying events.

The below command show the replication status

```sql
mysql> SHOW REPLICA STATUS\G
*************************** 1. row ***************************
             Replica_IO_State: Waiting for source to send event
                  Source_Host: dev01.kaskade.local
                  Source_User: replica_user
                  Source_Port: 3306
                Connect_Retry: 60
              Source_Log_File: mysql-bin.000003
          Read_Source_Log_Pos: 874
               Relay_Log_File: mysql-relay.000002
                Relay_Log_Pos: 328
        Relay_Source_Log_File: mysql-bin.000003
           Replica_IO_Running: Yes
          Replica_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Source_Log_Pos: 874
              Relay_Log_Space: 535
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Source_SSL_Allowed: No
           Source_SSL_CA_File:
           Source_SSL_CA_Path:
              Source_SSL_Cert:
            Source_SSL_Cipher:
               Source_SSL_Key:
        Seconds_Behind_Source: 0
Source_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error:
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Source_Server_Id: 1
                  Source_UUID: 2912c95d-e9f0-11ef-b511-0242ac140002
             Source_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
    Replica_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Source_Retry_Count: 10
                  Source_Bind:
      Last_IO_Error_Timestamp:
     Last_SQL_Error_Timestamp:
               Source_SSL_Crl:
           Source_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Source_TLS_Version:
       Source_public_key_path:
        Get_Source_public_key: 1
            Network_Namespace:
1 row in set (0.00 sec)
```

## Troubleshooting

- If a container fails to start, check the container logs with `docker compose logs` and the MySQL error log inside the container.
- Make sure each MySQL instance has a unique `server-id` in its `.cnf` file.
- If replication never starts, confirm network connectivity between containers and that the primary's binary log coordinates are being applied on the replica.
- For permission/ACL issues, see `deploy/sql/acl.sql` (this repo provides example user creation and grants).

## Notes and recommendations

- This repo contains multiple replication setups (8.0, 8.4, etc.). Pick the pair that matches your target MySQL version.
- Use snapshots or volume mounts cautiously; persistent volumes may keep old state between runs — remove volumes if you want a clean start (`docker compose down -v`).
- For automated CI, prefer non-interactive scripts that tear down and recreate containers to ensure reproducible state.

## Where to look next

- `deploy/replication/*` subfolders for versioned compose files and Makefiles.
- `deploy/standalone/` for a single-node example if you only need one server.
- `deploy/sql/acl.sql` for example users and grants used by some setups.

If you want, I can also:
- Add a one-command script at repository root to bring up a matched primary+replica pair for a selected version.
- Add health-check commands or a small verification script that prints replication status for both nodes.

---
Edited: improved quick start, commands, and troubleshooting notes to make replication setups easier to use locally.
)


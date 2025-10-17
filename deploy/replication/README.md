# MySQL Replication Deployment

This directory contains resources for deploying MySQL replication setups using Docker Compose.

## Quickstart

```bash
# Start the replication stack
make -C deploy/replication up

# Stop the replication stack
make -C deploy/replication stop

# Shell into a MySQL container
make -C deploy/replication shell ct=mysql-a

# View logs for a container
make -C deploy/replication logs ct=mysql-a
```

## Environment Configuration
- Secrets and configuration are managed via `docker-compose.env` and `Makefile.env`.
- Do not commit sensitive files; see `.gitignore` for ignored patterns.

## Troubleshooting
- If you encounter port conflicts, change the host port in `docker-compose.yml`.
- Ensure Docker is running before executing any commands.
- For volume issues, use `make -C deploy/replication volume.rm.all` to clean up dangling volumes.

## File Overview
- `docker-compose.yml`: Replication service definitions.
- `Makefile`: Management targets for starting/stopping and accessing services.
- `Makefile.env`: Environment variables for cluster and router.
- `docker-compose.env`: Secrets and MySQL configuration.
- `.gitignore`: Prevents sensitive/config files from being committed.

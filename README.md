# mysql_lab
MySQL study lab repo

# Docker deployment
## Standalone, Replication deployment
```
deploy/
├── replication
│   ├── repl-primary-8.0
│   │   ├── Makefile
│   │   ├── docker-compose.primary.yml
│   │   └── primary.cnf
│   ├── repl-primary-8.4
│   │   ├── Makefile
│   │   ├── docker-compose.primary.yml
│   │   └── primary.cnf
│   ├── repl-slave-8.0
│   │   ├── Makefile
│   │   ├── docker-compose.replica.yml
│   │   └── replica.cnf
│   └── repl-slave-8.4
│       ├── Makefile
│       ├── docker-compose.replica.yml
│       └── replica.cnf
└── standalone
    ├── db
    │   └── mysql
    │       ├── db.conf.8.x
    │       │   └── my.cnf
    │       └── db.init.8.x
    │           ├── dst
    │           │   └── 01-databases.sql
    │           └── src
    │               └── 01-databases.sql
    └── docker-compose.yml
```

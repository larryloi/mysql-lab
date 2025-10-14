# AI Coding Agent Instructions for `mysql_lab`

Welcome to the `mysql_lab` repository! This document provides essential guidelines for AI coding agents to be productive in this codebase. The repository is a MySQL study lab with Dockerized setups for standalone and replication deployments.

## Repository Overview

### Key Components
- **Standalone Deployment**:
  - Located in `deploy/standalone/`
  - Contains database configurations (`my.cnf`) and initialization scripts (`01-databases.sql`).
  - Uses `docker-compose.yml` for setup.
- **Replication Deployment**:
  - Located in `deploy/replication/`
  - Supports MySQL versions 8.0 and 8.4.
  - Includes primary and replica configurations with `Makefile`, `docker-compose` files, and configuration files (`primary.cnf`, `replica.cnf`).

### Directory Structure Highlights
- `benchmark/`: Contains scripts and configurations for benchmarking.
- `deploy/`: Houses Docker deployment setups for standalone and replication configurations.
- `sess_lock_wait/`: Includes scripts and Docker configurations for session lock wait experiments.

## Developer Workflows

### Building and Running
- Use `Makefile` targets in respective directories to build and run Docker containers.
  - Example: `make` in `deploy/replication/repl-primary-8.0/` builds and starts the primary replication setup for MySQL 8.0.
- For standalone setups, navigate to `deploy/standalone/` and use `docker-compose up`.

### Debugging
- Logs for MySQL containers are accessible via `docker logs <container_id>`.
- Configuration files (`my.cnf`, `primary.cnf`, `replica.cnf`) can be modified to adjust MySQL settings.

## Project-Specific Conventions
- **Configuration Files**:
  - MySQL configurations are version-specific and located in subdirectories (e.g., `db.conf.8.x`).
  - Initialization scripts are split into `src` and `dst` directories for source and destination SQL files.
- **Docker Compose**:
  - Separate `docker-compose` files for primary and replica setups in replication deployments.

## Integration Points
- **External Dependencies**:
  - Relies on Docker and Docker Compose for containerized setups.
  - MySQL configurations and initialization scripts are critical for proper deployment.
- **Cross-Component Communication**:
  - Replication setups involve communication between primary and replica containers, configured via `docker-compose` and `.cnf` files.

## Examples
- To deploy a standalone MySQL instance:
  ```bash
  cd deploy/standalone/
  docker-compose up
  ```
- To set up primary replication for MySQL 8.0:
  ```bash
  cd deploy/replication/repl-primary-8.0/
  make
  ```

## Notes
- Ensure Docker is installed and running before executing any commands.
- Modify `.cnf` files as needed to customize MySQL configurations.

For further details, refer to the `README.md` files in respective directories.
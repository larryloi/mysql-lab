#include ../Makefile
include ./Makefile.env

# Default target: help
.DEFAULT_GOAL := help
# Default variables (can be overridden)
ct ?= mysql-a

# Colors for output
RED := \033[31m
GREEN := \033[32m
YELLOW := \033[33m
BLUE := \033[34m
MAGENTA := \033[35m
CYAN := \033[36m
WHITE := \033[37m
RESET := \033[0m


#print_vars:
#   @echo "Makefile variables:"
#   @for var in $(VARS_TO_PRINT); do \
#       echo "  $$var = $${!var}"; \
#   done


help:
	@echo "$(GREEN)Available targets:$(RESET)"
	@echo "  up.all            - Start cluster (optionally ct=<container>)"
	@echo "  down.all          - Stop cluster"
	@echo "  stop              - Stop containers"
	@echo "  shell             - Shell into container (ct=<container>)"
	@echo "  mysql             - MySQL client (ct=<container>)"
	@echo "  mysqlsh           - MySQL Shell (ct=<container>)"
	@echo "  ps                - List containers"
	@echo "  logs              - Show logs (ct=<container>)"
	@echo "  volume.rm.all     - Remove dangling volumes"
	@echo "  volume.ls         - List volumes"
	@echo "  env               - Show environment configuration"
	@echo "  mysql.create.login  - Create MySQL login for cluster user"
	@echo "  mysql.create.schema - Create demo schemas in MySQL"

.PHONY: up.all
up.all: ## Start services (usage: make up db=mysql)
	@echo "$(GREEN)Starting $(db) services...$(RESET)"
	docker compose up -d
	@echo "$(GREEN)✓ Services started successfully$(RESET)"
	
.PHONY: down.all
down.all: ## Stop and remove all services
	@echo "$(GREEN)Stopping all services...$(RESET)"
	docker compose down
	@echo "$(GREEN)✓ All services stopped successfully$(RESET)"

.PHONY: stop
stop:
	@docker compose stop $(ct)

.PHONY: shell
shell: ## Open shell in container (usage: make shell ct=<container>)
	@echo "$(GREEN)Opening shell in container '$(ct)'...$(RESET)"
	@docker compose exec $(ct) bash

.PHONY: ps
ps:
	@echo "$(GREEN)All Services Status:$(RESET)"
	docker compose ps -a

.PHONY: logs
logs:
	@docker logs -f $(ct)

.PHONY: volume.ls
volume.ls:
	@echo "$(GREEN)Docker Volumes:$(RESET)"
	@docker volume ls

.PHONY: volume.rm
volume.rm: ## Remove Docker volumes
	@echo "$(GREEN)Removing Docker volumes...$(RESET)"
	@docker volume rm $(DOCKER_VOLUME)

.PHONY: mysqlsh
mysqlsh: ## Open MySQL Shell in container (usage: make mysqlsh ct=<container>)
	@echo "$(GREEN)Opening MySQL Shell in container '$(ct)'...$(RESET)"
	@docker compose exec $(ct) mysqlsh -uroot -p$(MYSQL_ROOT_PASSWORD) --sql

.PHONY: mysql.create.login
mysql.create.login: ## Create MySQL login for cluster user
	@echo "$(GREEN)Creating MySQL user login...$(RESET)"
	docker exec -i $(ct) mysql -uroot -p$(MYSQL_ROOT_PASSWORD) < $(SQL_PATH)/acl.sql

.PHONY: mysql.create.schema
mysql.create.schema:
	@echo "$(GREEN)Creating MySQL schemas...$(RESET)"
	# Run the SQL file from the host into the mysql container. Use relative path so
	# the Makefile can be run from the repository root.
	@echo "Applying company schema (using utf8mb4 client)..."
	docker exec -i $(ct) mysql --default-character-set=utf8mb4 -uroot -p$(MYSQL_ROOT_PASSWORD) < $(SQL_PATH)/create_company_schema.sql || true
	@echo "Applying demonslayer schema (using utf8mb4 client)..."
	docker exec -i $(ct) mysql --default-character-set=utf8mb4 -uroot -p$(MYSQL_ROOT_PASSWORD) < $(SQL_PATH)/create_demonslayer_schema.sql || true
	@echo "Schemas applied."
	@echo "Applying inventory schema (using utf8mb4 client)..."
	docker exec -i $(ct) mysql --default-character-set=utf8mb4 -uroot -p$(MYSQL_ROOT_PASSWORD) < $(SQL_PATH)/create_inventory_schema.sql || true
	@echo "Schemas applied."


# ===================================
# Environment Targets
# ===================================

.PHONY: env
env: ## Show environment configuration
	@echo "$(GREEN)Environment Configuration:$(RESET)"
	@echo "MYSQL_HOST: $(MYSQL_HOST)"
	@echo "MYSQL_PORT: $(MYSQL_PORT)"
	@echo "MYSQL_USER: $(MYSQL_USER)"
	@echo "MYSQL_PASSWORD: $(MYSQL_PASSWORD)"
	@echo "DOCKER_IMAGE: $(DOCKER_IMAGE)"
	@echo "TZ: $(TZ)"
	@echo "SQL_PATH: $(SQL_PATH)"
	@echo "ct: $(ct)"

#	@echo "DOCKER_VOLUME: $(DOCKER_VOLUME)"

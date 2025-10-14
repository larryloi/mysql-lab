# Default target: help
.DEFAULT_GOAL := help

include Makefile.env

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

VARS_TO_PRINT = ct CLUSTER_USER CLUSTER_USER_PASSWORD MYSQL_ROUTER_IMAGE MYSQL_HOST MYSQL_PORT MYSQL_USER MYSQL_PASSWORD MYSQL_INNODB_CLUSTER_MEMBERS

#print_vars:
#   @echo "Makefile variables:"
#   @for var in $(VARS_TO_PRINT); do \
#       echo "  $$var = $${!var}"; \
#   done

.PHONY: help up down stop mysql mysqlsh shell ps logs volume.rm.all volume.ls router0.run router1.run router.shell print_vars

help:
	@echo "$(GREEN)Available targets:$(RESET)"
	@echo "  up                - Start cluster (optionally ct=<container>)"
	@echo "  down              - Stop cluster"
	@echo "  stop              - Stop containers"
	@echo "  shell             - Shell into container (ct=<container>)"
	@echo "  mysql             - MySQL client (ct=<container>)"
	@echo "  mysqlsh           - MySQL Shell (ct=<container>)"
	@echo "  ps                - List containers"
	@echo "  logs              - Show logs (ct=<container>)"
	@echo "  volume.rm.all     - Remove dangling volumes"
	@echo "  volume.ls         - List volumes"
	@echo "  router0.run       - Run MySQL Router 0"
	@echo "  router1.run       - Run MySQL Router 1"
	@echo "  router.shell      - Shell into router container"

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

stop:
	@docker compose stop $(ct)

mysqlsh.admin: print_vars
	@docker compose exec $(ct) mysqlsh $(ADMIN_SECERT) -hlocalhost --sql

mysqlsh.cluster: print_vars
	@docker compose exec $(ct) mysqlsh $(CLUSTER_SECERT) -hlocalhost --js

shell: print_vars
	@echo "$(GREEN)Opening shell in container '$(ct)'...$(RESET)"
	@docker compose exec $(ct) bash

ps:
	@echo "$(GREEN)All Services Status:$(RESET)"
	docker compose ps -a

logs: print_vars
	@docker compose logs -f $(ct)

volume.rm.all:
	@echo "$(GREEN)Removing dangling Docker volumes...$(RESET)"
	@docker volume rm $$(docker volume ls -qf dangling=true)

volume.ls:
	@echo "$(GREEN)Docker Volumes:$(RESET)"
	@docker volume ls

ROUTER_PORTS = -p 6446:6446 -p 6447:6447 -p 6448:6448 -p 6449:6449 -p 6450:6450
ROUTER1_PORTS = -p 16446:6446 -p 16447:6447 -p 16448:6448 -p 16449:6449 -p 16450:6450

router0.run:
	@docker run -d \
		--name router-0 \
		-e MYSQL_HOST=$(MYSQL_HOST) \
		-e MYSQL_PORT=$(MYSQL_PORT) \
		-e MYSQL_USER=$(MYSQL_USER) \
		-e MYSQL_PASSWORD=$(MYSQL_PASSWORD) \
		-e MYSQL_INNODB_CLUSTER_MEMBERS=$(MYSQL_INNODB_CLUSTER_MEMBERS) \
		--network cluster_mysql-cluster \
		$(ROUTER_PORTS) \
		-ti $(MYSQL_ROUTER_IMAGE)

router1.run:
	@docker run -d \
		--name router-1 \
		-e MYSQL_HOST=$(MYSQL_HOST) \
		-e MYSQL_PORT=$(MYSQL_PORT) \
		-e MYSQL_USER=$(MYSQL_USER) \
		-e MYSQL_PASSWORD=$(MYSQL_PASSWORD) \
		-e MYSQL_INNODB_CLUSTER_MEMBERS=$(MYSQL_INNODB_CLUSTER_MEMBERS) \
		--network cluster_mysql-cluster \
		$(ROUTER1_PORTS) \
		-ti $(MYSQL_ROUTER_IMAGE)

router.shell:
	@docker run \
		-e MYSQL_HOST=$(MYSQL_HOST) \
		-e MYSQL_PORT=$(MYSQL_PORT) \
		-e MYSQL_USER=$(MYSQL_USER) \
		-e MYSQL_PASSWORD=$(MYSQL_PASSWORD) \
		-e MYSQL_INNODB_CLUSTER_MEMBERS=$(MYSQL_INNODB_CLUSTER_MEMBERS) \
		--network cluster_default \
		$(ROUTER_PORTS) \
		-ti $(MYSQL_ROUTER_IMAGE) /bin/bash

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
	@echo "MYSQL_INNODB_CLUSTER_MEMBERS: $(MYSQL_INNODB_CLUSTER_MEMBERS)"

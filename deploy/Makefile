include Makefile.env

ct ?= 

# Helper to conditionally add container argument
CONTAINER_ARG = $(if $(ct),$(ct),)

VARS_TO_PRINT = ct CLUSTER_USER CLUSTER_USER_PASSWORD MYSQL_ROUTER_IMAGE MYSQL_HOST MYSQL_PORT MYSQL_USER MYSQL_PASSWORD MYSQL_INNODB_CLUSTER_MEMBERS

define print_vars
	@echo "Makefile variables:"
	$(foreach var,$(VARS_TO_PRINT),\
		echo "  $(var) = $($(var))\n"\
	)
endef

up:
	env | grep -E '(MYSQL|CLUSTER)' |sort
	docker compose up -d $(CONTAINER_ARG)

#down:
#	@if [ -n "$(ct)" ]; then \
#		echo "Note: 'ct' variable ignored for 'down' - stopping entire project"; \
#	fi
#	docker compose down

stop:
	docker compose stop $(CONTAINER_ARG)

mysql:
	$(print_vars)
	docker compose exec ${ct} mysql -u$(CLUSTER_USER) -p$(CLUSTER_USER_PASSWORD) -hlocalhost

mysqlsh:
	$(print_vars)
	docker compose exec ${ct} mysqlsh -u$(CLUSTER_USER) -p$(CLUSTER_USER_PASSWORD) -hlocalhost

shell:
	$(print_vars)
	docker compose exec ${ct} bash


ps:
	docker compose ps -a

logs:
	$(print_vars)
	docker compose logs -f $(CONTAINER_ARG)

volume.rm.all:
	docker volume rm $$(docker volume ls -qf dangling=true)

volume.ls:
	docker volume ls


router0.run:
	docker run -d \
	--name router-0	\
	-e MYSQL_HOST=$(MYSQL_HOST) \
	-e MYSQL_PORT=$(MYSQL_PORT) \
	-e MYSQL_USER=$(MYSQL_USER) \
	-e MYSQL_PASSWORD=$(MYSQL_PASSWORD) \
	-e MYSQL_INNODB_CLUSTER_MEMBERS=$(MYSQL_INNODB_CLUSTER_MEMBERS) \
	--network cluster_mysql-cluster \
	-p 6446:6446 \
	-p 6447:6447 \
	-p 6448:6448 \
	-p 6449:6449 \
	-p 6450:6450 \
	-ti $(MYSQL_ROUTER_IMAGE)


router1.run:
	docker run -d \
	--name router-1 \
	-e MYSQL_HOST=$(MYSQL_HOST) \
	-e MYSQL_PORT=$(MYSQL_PORT) \
	-e MYSQL_USER=$(MYSQL_USER) \
	-e MYSQL_PASSWORD=$(MYSQL_PASSWORD) \
	-e MYSQL_INNODB_CLUSTER_MEMBERS=$(MYSQL_INNODB_CLUSTER_MEMBERS) \
	--network cluster_mysql-cluster \
	-p 16446:6446 \
	-p 16447:6447 \
	-p 16448:6448 \
	-p 16449:6449 \
	-p 16450:6450 \
	-ti $(MYSQL_ROUTER_IMAGE)



r.shell:
	docker run \
	-e MYSQL_HOST=$(MYSQL_HOST) \
	-e MYSQL_PORT=$(MYSQL_PORT) \
	-e MYSQL_USER=$(MYSQL_USER) \
	-e MYSQL_PASSWORD=$(MYSQL_PASSWORD) \
	-e MYSQL_INNODB_CLUSTER_MEMBERS=$(MYSQL_INNODB_CLUSTER_MEMBERS) \
	--network cluster_default \
	-p 6446:6446 \
	-p 6447:6447 \
	-p 6448:6448 \
	-p 6449:6449 \
	-p 6450:6450 \
	-ti $(MYSQL_ROUTER_IMAGE) /bin/bash


include Makefile.env

ct ?= 

# Helper to conditionally add container argument
CONTAINER_ARG = $(if $(ct),$(ct),)


up:
	docker compose up -d $(CONTAINER_ARG)

#down:
#	@if [ -n "$(ct)" ]; then \
#		echo "Note: 'ct' variable ignored for 'down' - stopping entire project"; \
#	fi
#	docker compose down

stop:
	docker compose stop $(CONTAINER_ARG)

mysql:
	docker compose exec ${ct} mysql -u$(user) -p$(password) -hlocalhost

mysqlsh:
	docker compose exec ${ct} mysqlsh -u$(user) -p$(password) -hlocalhost

shell:
	docker compose exec ${ct} bash


ps:
	docker compose ps -a

logs:
	docker compose logs -f $(CONTAINER_ARG)

volume.rm.all:
	docker volume rm $$(docker volume ls -qf dangling=true)

volume.ls:
	docker volume ls

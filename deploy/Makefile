up:
	docker compose up -d

down:
	docker compose down


mysql:
	docker compose exec mysql mysql -uroot -prootpass -hlocalhost

mysqlsh:
	docker compose exec mysql mysqlsh -uroot -prootpass -hlocalhost

shell:
	docker compose exec mysql bash

######
primary.mysql:
	docker compose exec mysql_primary mysql -uroot -prootpass -hlocalhost

primary.mysqlsh:
	docker compose exec mysql_primary mysqlsh -uroot -prootpass -hlocalhost

primary.shell:
	docker compose exec mysql_primary bash

replica.mysql:
	docker compose exec mysql_replica mysql -uroot -prootpass -hlocalhost

replica.mysqlsh:
	docker compose exec mysql_replica mysqlsh -uroot -prootpass -hlocalhost

replica.shell:
	docker compose exec mysql_replica bash

ps:
	docker compose ps

logs:
	docker compose logs -f

volume.rm.all:
	docker volume rm $$(docker volume ls -qf dangling=true)

volume.ls:
	docker volume ls
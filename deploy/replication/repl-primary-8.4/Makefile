up:
	docker compose -f docker-compose.primary.yml up -d

down:
	docker compose -f docker-compose.primary.yml down

mysql:
	docker compose -f docker-compose.primary.yml exec mysql_primary mysql -uroot -prootpass -hlocalhost

shell:
	docker compose -f docker-compose.primary.yml exec mysql_primary bash

ps:
	docker compose -f docker-compose.primary.yml ps

logs:
	docker compose -f docker-compose.primary.yml logs -f

volume.rm.all:
	docker volume rm $$(docker volume ls -qf dangling=true)

volume.ls:
	docker volume ls
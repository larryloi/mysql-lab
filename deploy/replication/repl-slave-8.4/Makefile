up:
	docker compose -f docker-compose.replica.yml up -d

down:
	docker compose -f docker-compose.replica.yml down

shell:
	docker compose -f docker-compose.replica.yml exec -it mysql_replica mysql -uroot -prootpass

ps:
	docker compose -f docker-compose.replica.yml ps

logs:
	docker compose -f docker-compose.replica.yml logs -f

volume.rm.all:
	docker volume rm $$(docker volume ls -qf dangling=true)

volume.ls:
	docker volume ls
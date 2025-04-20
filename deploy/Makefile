include Makefile.env

up:
	docker compose up -d

down:
	docker compose down


mysql:
	docker compose exec ${CT_NAME} mysql -uroot -prootpass -hlocalhost

mysqlsh:
	docker compose exec ${CT_NAME} mysqlsh -uroot -prootpass -hlocalhost

shell:
	docker compose exec ${CT_NAME} bash


ps:
	docker compose ps

logs:
	docker compose logs -f

volume.rm.all:
	docker volume rm $$(docker volume ls -qf dangling=true)

volume.ls:
	docker volume ls

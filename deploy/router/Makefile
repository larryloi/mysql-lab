include Makefile.env

build:
	docker build -t $(IMAGE_REPO):$(TAG) .

r0.run:
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
		-v $(PWD)/resource/:/resource/ \
		-ti $(IMAGE_REPO):$(TAG)


r1.run:
	docker run \
		-e MYSQL_HOST=$(MYSQL_HOST) \
		-e MYSQL_PORT=$(MYSQL_PORT) \
		-e MYSQL_USER=$(MYSQL_USER) \
		-e MYSQL_PASSWORD=$(MYSQL_PASSWORD) \
		-e MYSQL_INNODB_CLUSTER_MEMBERS=$(MYSQL_INNODB_CLUSTER_MEMBERS) \
		--network cluster_default \
		-p 16446:6446 \
		-p 16447:6447 \
		-p 16448:6448 \
		-p 16449:6449 \
		-p 16450:6450 \
		-v $(PWD)/resource/:/resource/ \
		-ti $(IMAGE_REPO):$(TAG)


shell:
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
	-v $(PWD)/mysqlrouter.conf:/etc/mysqlrouter/mysqlrouter.conf \
	-v $(PWD)/myrouter/:/tmp/myrouter/:rw \
	-v $(PWD)/myrouter/mysqlrouter.key:/tmp/myrouter/mysqlrouter.key:ro \
	-ti $(IMAGE_REPO):$(TAG) /bin/bash








# mysqlrouter -c /etc/mysqlrouter/mysqlrouter.conf
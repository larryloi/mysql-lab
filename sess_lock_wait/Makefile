#!make
include .env
export $(shell sed 's/=.*//' .env)


build:
	docker build -t $(IMAGE):$(TAG) .

run:
	docker run -d --env-file .env $(IMAGE):$(TAG)

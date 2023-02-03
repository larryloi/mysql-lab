version: '3'
services:
  app:
    image: "${REPO_PATH}${IMAGE}:${TAG}"
    #build: .
    env_file:
      - .env
    volumes:
      - ./app/:/app/
    entrypoint: /bin/bash
    stdin_open: true
    tty: true
[root@ip-10-1-1-229 ruby-app]# cat Dockerfile
FROM larryloi/centos7-ruby2.7.2:1.0.0
MAINTAINER Larry Loi<larry.loi@gamesourcecloud.com>

COPY Gemfile $REL_PATH/Gemfile

RUN /bin/bash -l -c "bundle install"

LABEL application=ruby-app

FROM larryloi/centos7-ruby2.7.2:1.0.0
MAINTAINER Larry Loi<larry.loi@gamesourcecloud.com>

COPY Gemfile $REL_PATH/Gemfile

RUN /bin/bash -l -c "bundle install"

LABEL application=ruby-app

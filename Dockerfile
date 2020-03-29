FROM ubuntu:20.04

MAINTAINER pbount <pavlos.bountagkidis@outlook.com>

ENV DEBIAN_FRONTEND noninteractive

ARG user=superuser
ARG password=password
ARG database=database

RUN apt-get update && apt-get install -y python3-pip python3 postgresql
RUN service postgresql start
RUN sleep 5

# Nested execution of commands. "Create Role" is a command executed using psql which is executed under the
# default "postgres" user
RUN su postgres -c "psql -c \"CREATE ROLE ${user} PASSWORD '${password}' SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN;\""
RUN su postgres -c "createdb -O ${user} ${database}"
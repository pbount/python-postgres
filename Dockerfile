FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV INSTALL_ON_LINUX 1

# ARG user=superuser
# ARG password=password
# ARG database=database

RUN apt-get update && apt-get install -y python3-pip python3 postgresql

# Run commands are executed when the container is being built. However, the service must be started
# during container runtime. Same for the creation of the user and databases as those require a running
# postgresql service.
# - service postgresql start

# Nested execution of commands. "Create Role" is a command executed using psql which is executed under the
# default "postgres" user
# - su postgres -c "psql -c \"CREATE ROLE ${user} PASSWORD '${password}' SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN;\""
# - su postgres -c "createdb -O ${user} ${database}"

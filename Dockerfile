FROM ubuntu:20.04

MAINTAINER pbount <npbount@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y python3-pip python3 sudo git postgresql
RUN service postgresql start
RUN su postgres -c "psql -c \"CREATE ROLE msbeta PASSWORD 'password' SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN;\""
RUN su postgres -c "createdb -O msbeta betas"
RUN cd ms-beta
RUN pip3 install -r requirements.txt
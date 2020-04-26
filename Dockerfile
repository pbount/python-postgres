FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV INSTALL_ON_LINUX 1

ADD ./requirements.txt ./requirements.txt

RUN apt-get update && apt-get install -y python3-pip python3 postgresql
RUN pip3 install -r requirements.txt

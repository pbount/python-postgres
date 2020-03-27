FROM postgres:12.2

ENV PGDATABASE betas

RUN apt update
RUN apt install software-properties-common -y
RUN apt install python3.7 -y
RUN apt-get install python3-pip -y

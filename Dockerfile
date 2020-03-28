FROM postgres:12

MAINTAINER pbount <npbount@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV POSTGRES_USER user
ENV POSTGRES_PASSWORD password
ENV POSTGRES_DB betas

# RUN apt-get update && apt-get install -y python3-pip python3-dev libpq-dev build-essential gcc autoconf libtool pkg-config libssl-dev libxml2-dev libxslt1-dev libffi-dev sudo git && \
RUN apt-get update && apt-get install -y python3-pip python3 sudo git && \
  pip3 install --no-cache-dir --upgrade setuptools && \
  pip3 install --no-cache-dir --upgrade six && \
#   pip3 install --no-cache-dir psycopg2 &&\
#   locale-gen en_US.UTF-8 && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

# RUN service postgresql start
# RUN su postgres
# RUN createdb betas
# RUN psql -c "create role user with login password 'password';"

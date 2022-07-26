FROM debian:buster-slim

RUN apt-get update -y 
RUN apt-get install mariadb-server -y
COPY ./conf/mariadb.conf ./etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/db_config.sql ./
RUN service mysql start && mysql < db_config.sql
RUN rm db_config.sql

EXPOSE 3306

CMD /usr/bin/mysqld_safe
FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install mariadb-server vim curl -y;

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/mysql.sh mysql.sh

EXPOSE 3306

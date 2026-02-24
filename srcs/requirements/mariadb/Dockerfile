FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install mariadb-server vim curl -y;

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/mysql.sh mysql.sh

RUN chmod +x mysql.sh 

RUN mkdir -m 755 -p /var/run/mysqld
RUN mkdir -m 755 -p /var/lib/mysql
RUN chown mysql:mysql /var/run/mysqld
RUN chown mysql:mysql /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["sh", "./mysql.sh"] 

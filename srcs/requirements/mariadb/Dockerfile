FROM debian:bullseye

EXPOSE 3306

COPY ./tools /var/www/

RUN apt-get update && \
	apt-get install mariadb-server -y && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf && \
	service mariadb start && \
        mariadb < /var/www/createdb.sql && \
        rm /var/www/createdb.sql

ENTRYPOINT ["/usr/bin/mysqld_safe"]

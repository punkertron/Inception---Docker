FROM debian:bullseye

EXPOSE 3306

RUN apt-get update && \
	apt-get install mariadb-server -y && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/initial.sh .

ENTRYPOINT ["bash", "initial.sh"]

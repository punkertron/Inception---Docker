FROM debian:bullseye

EXPOSE 3306

RUN apt-get update && \
	apt-get install mariadb-server -y && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./tools/initial.sh .

ENTRYPOINT ["bash", "initial.sh"]

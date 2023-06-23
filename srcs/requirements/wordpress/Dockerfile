FROM debian:bullseye

EXPOSE 9000

RUN apt-get update && \
	apt-get install php7.3 php-mysql php-fpm -y && \
	apt-get clean && rm -rf /var/lib/apt/lists/*


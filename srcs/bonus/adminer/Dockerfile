FROM debian:bullseye

EXPOSE 8080

RUN apt-get update && \
	apt-get install -y \
		php7.4 \
		php7.4-mysql \
		wget && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php" -O /var/www/html/index.php

ENTRYPOINT [ "php", "-S", "[::]:8080", "-t", "/var/www/html" ]

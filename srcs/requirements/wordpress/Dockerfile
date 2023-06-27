FROM debian:bullseye

EXPOSE 9000

RUN apt-get update && \
	apt-get install -y \
		php7.4 \
		php7.4-mysqli \
		php7.4-cli \
		php7.4-mysqli \
		php7.4-fpm \
		php7.4-dom \
		php7.4-exif \
		php7.4-fileinfo \
		php7.4-imagick \
		php7.4-mbstring \
		openssl \
		php7.4-xml \
		php7.4-zip \
		wget \
		unzip && \
	sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html/wordpress
COPY ./tools/ .

RUN service php7.4-fpm start

ENTRYPOINT ["bash", "initial_setup.sh"]

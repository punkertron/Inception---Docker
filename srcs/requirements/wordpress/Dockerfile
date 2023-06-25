FROM debian:bullseye

EXPOSE 9000

RUN apt-get update && \
	apt-get install -y \
		curl \
		php-cli \
		php-mysqli \
		php-fpm \
		#php-dom \
		#php-exif \
		#php-fileinfo \
		#php-imagick \
		#php-mbstring \
		#php-xml \
		#php-zip \
		wget \
		unzip \
		mariadb-client && \
	sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html/

RUN wget https://wordpress.org/latest.zip && \
	unzip latest.zip && \
	rm -rf latest.zip

COPY ./conf/ ./wordpress
RUN pwd && ls -lR

RUN service php7.4-fpm start

ENTRYPOINT ["php-fpm7.4", "-F"]

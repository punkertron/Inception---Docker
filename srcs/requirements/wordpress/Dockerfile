FROM debian:bullseye

EXPOSE 9000

RUN apt-get update && \
	apt-get install -y \
		php7.4 \
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
		unzip && \
	sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html/

RUN wget https://wordpress.org/latest.zip && \
	unzip latest.zip && \
	rm -rf latest.zip

WORKDIR /var/www/html/wordpress

COPY ./conf/ .
COPY ./tools/ .

RUN bash initial_setup.sh
#service php7.4-fpm start && \

ENTRYPOINT ["php-fpm7.4", "-F"]

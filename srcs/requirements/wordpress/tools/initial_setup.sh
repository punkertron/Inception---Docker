#!/bin/bash

chmod -R 775 /var/www/html/wordpress;
chown -R www-data /var/www/html/wordpress;
mkdir -p /run/php/;
touch /run/php/php7.4-fpm.pid

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;

chmod -R 775 /var/www/html/wordpress;

wp core download --allow-root;
#mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php


#wp config set DB_NAME wordpress --allow-root;
#wp config set DB_USER drohanne --allow-root;
#wp config set DB_PASSWORD password --allow-root;
#wp config set DB_HOST mariadb --allow-root; 


wp core install \
	--url=drohanne.42.fr \
	--title=Wordpress\
	--admin_user=root \
	--admin_password=strongpassword \
	--admin_email=drohanne@student.42yerevan.am \
	--allow-root;
	#--path=/var/www/html/wordpress;

wp user create Vladislav vladislav@example.com \
	--usserpass=password \
       	--role=author \
	--allow-root ;
	#--path=/var/www/html/wordpress;

wp theme install twentytwenty-three --activate \
	--allow-root;
	#--path=/var/www/html/wordpress;

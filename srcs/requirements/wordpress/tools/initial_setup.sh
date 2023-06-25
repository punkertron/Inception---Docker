#!/bin/bash

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;

chmod -R 775 /var/www/html/wordpress;

wp core download --allow-root;
rm /var/www/html/wordpress/wp-config-sample.php;


#wp core config --dbhost=mariadb --dbname=wordpress --dbuser=drohanne --dbpass=password --allow-root;


pwd;
ls;

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

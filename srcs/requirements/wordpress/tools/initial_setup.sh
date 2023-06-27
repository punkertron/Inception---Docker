#!/bin/bash

wp core download --allow-root

wp config set DB_NAME $DB_NAME  --allow-root
wp config set DB_USER $DB_USER  --allow-root
wp config set DB_PASSWORD $DB_PASS  --allow-root
wp config set DB_HOST $WDB_HOST  --allow-root

wp core install \
	--url=$W_URL \
	--title=$W_TITLE \
	--admin_user=$W_ADM_USER \
	--admin_password=$W_ADM_PASS \
	--admin_email=$W_ADM_MAIL \
	--allow-root

wp user create $W_USER $W_MAIL \
	--user_pass=$W_PASS \
       	--role=$W_ROLE \
	--allow-root 

wp theme install twentytwentythree --activate \
	--allow-root

php-fpm7.4 -F

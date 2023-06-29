#!/bin/bash


#core
wp core download --allow-root

mv wp-config-sample.php wp-config.php

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



#redis

chmod -R 777 wp-content
chmod -R 777 wp-admin

wp plugin install redis-cache --activate --allow-root

wp config set WP_REDIS_HOST $REDIS_HOST --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp config set WP_REDIS_DATABASE 0 --allow-root
wp config set WP_REDIS_TIMEOUT 1 --allow-root
wp config set WP_REDIS_READ_TIMEOUT 1 --allow-root

wp redis enable --allow-root

php-fpm7.4 -F

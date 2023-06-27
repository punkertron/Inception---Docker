#!/bin/bash

echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" > createdb.sql
echo "CREATE USER IF NOT EXISTS '${DB_USER}' IDENTIFIED BY '${DB_PASS}';" >> createdb.sql
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}';" >> createdb.sql
echo "FLUSH PRIVILEGES;" >> createdb.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASS}';" >> createdb.sql

service mariadb start
mariadb < createdb.sql
rm createdb.sql

mysqladmin shutdown -p${ROOT_PASS}

/usr/bin/mysqld_safe

#!bin/sh

CREATE DATABASE wordpress;
CREATE USER wordpress@localhost IDENTIFIED BY 'pass';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;
FLUSH PRIVILEGES;


CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'drohanne' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'drohanne';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'superpassword';

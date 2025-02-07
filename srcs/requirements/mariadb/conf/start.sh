#!/bin/bash

set -e

service mariadb start

mysql -u root -e "GRANT ALL ON *.* TO '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;"
# mysql -u root -e "CREATE DATABASE wordpress;"
# mysql -u root -e "CREATE USER 'wp_user'@'%' IDENTIFIED BY 'wp_password';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

service mariadb stop

exec mysqld_safe

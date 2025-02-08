#!/bin/bash

set -e

service mariadb start

if ! mysql -u root -e "SELECT 1;" >/dev/null 2>&1; then
    mysql -u root <<-EOSQL
        SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MARIADB_ROOT_PASSWORD}');
        FLUSH PRIVILEGES;
EOSQL
fi

# Create database and user
mysql -u root -p"${MARIADB_ROOT_PASSWORD}" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS ${MARIADB_NAME};
    CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${MARIADB_NAME}.* TO '${MARIADB_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

mysqladmin -u root -p"${MARIADB_ROOT_PASSWORD}" shutdown

exec mysqld

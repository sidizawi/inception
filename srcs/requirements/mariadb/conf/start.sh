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
    CREATE DATABASE IF NOT EXISTS ${DB_NAME};
    CREATE USER IF NOT EXISTS '${DB_ADMIN}'@'%' IDENTIFIED BY '${DB_ADMIN_PASSWD}';
    GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_ADMIN}'@'%';
    FLUSH PRIVILEGES;
EOSQL

mysqladmin -u root -p"${MARIADB_ROOT_PASSWORD}" shutdown

exec mysqld

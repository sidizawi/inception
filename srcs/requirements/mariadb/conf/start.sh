#!/bin/bash

set -e

service mariadb start

if ! mysql -u root -e "SELECT 1;" >/dev/null 2>&1; then
    echo "adding a password to root"
    mysql -u root <<-EOSQL
        SET PASSWORD FOR 'root'@'localhost' = PASSWORD("${MARIADB_ROOT_PASSWORD}");
        FLUSH PRIVILEGES;
EOSQL
fi

# Create database and user
mysql -u root -p"${MARIADB_ROOT_PASSWORD}" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME};
    CREATE USER IF NOT EXISTS '${WP_DB_ADMIN}'@'%' IDENTIFIED BY '${WP_DB_ADMIN_PASSWD}';
    GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_ADMIN}'@'%';
    CREATE DATABASE IF NOT EXISTS ${TYPEFORM_DB_NAME};
    CREATE USER IF NOT EXISTS '${TYPEFORM_DB_USER}'@'%' IDENTIFIED BY '${TYPEFORM_DB_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${TYPEFORM_DB_NAME}.* TO '${TYPEFORM_DB_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

mysqladmin -u root -p"${MARIADB_ROOT_PASSWORD}" shutdown

exec mysqld

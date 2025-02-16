#!/bin/bash

set -e

while ! mysql -h mariadb ${WP_DB_NAME} -u "${WP_DB_ADMIN}" -p"${WP_DB_ADMIN_PASSWD}" -e "SELECT 1;" >/dev/null 2>&1; do
    echo "Waiting for MariaDB..."
    sleep 2
done

python3 manage.py migrate

exec python3 manage.py runserver 0.0.0.0:8081

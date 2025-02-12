#!/bin/sh

set -e

while ! mysql -h mariadb ${DB_NAME} -u "${DB_ADMIN}" -p"${DB_ADMIN_PASSWD}" -e "SELECT 1;" >/dev/null 2>&1; do
    echo "Waiting for MariaDB..."
    sleep 2
done

if ! su -p www-data -c "wp core is-installed --path=/var/www/html"; then
    su -p www-data -c "wp core install \
        --path=/var/www/html \
        --url="${WP_URL}" \
        --title="${WP_TITLE}" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASS}" \
        --admin_email="${WP_ADMIN_EMAIL}""
fi

# Create admin user if it doesn't exist
if ! su -p www-data -c "wp user list --field=user_login --path=/var/www/html | grep -q "${WP_ADMIN_USER}""; then
    su -p www-data -c "wp user create "${WP_ADMIN_USER}" "${WP_ADMIN_EMAIL}" \
		--role=administrator \
		--user_pass="${WP_ADMIN_PASS}" \
		--path=/var/www/html"
fi

# Create regular user if it doesn't exist
if ! su -p www-data -c "wp user list --field=user_login --path=/var/www/html | grep -q "${WP_REGULAR_USER}""; then
    su -p www-data -c "wp user create "${WP_REGULAR_USER}" "${WP_REGULAR_EMAIL}" \
		--path=/var/www/html \
		--role=subscriber \
		--user_pass="${WP_REGULAR_PASS}""
fi

exec php-fpm7.4 -F

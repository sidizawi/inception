#!/bin/sh

set -e

# if ! su - www-data -c "wp core is-installed --path=/var/www/html/wordpress"; then
#     su - www-data -c "wp core install \
# 		--path=/var/www/html/wordpress \
#         --url="${WP_URL}" \
#         --title="${WP_TITLE}" \
#         --admin_user="${WP_ADMIN_USER}" \
#         --admin_password="${WP_ADMIN_PASS}" \
#         --admin_email="${WP_ADMIN_EMAIL}""
# fi

# # Create admin user if it doesn't exist
# if ! su - www-data -c "wp user list --field=user_login --path=/var/www/html/wordpress | grep -q "${WP_ADMIN_USER}""; then
#     su - www-data -c "wp user create "${WP_ADMIN_USER}" "${WP_ADMIN_EMAIL}" --role=administrator --user_pass="${WP_ADMIN_PASS}" --path=/var/www/html/wordpress"
# fi

# # Create regular user if it doesn't exist
# if ! su - www-data -c "wp user list --field=user_login --path=/var/www/html/wordpress | grep -q "${WP_REGULAR_USER}""; then
#     su - www-data -c "wp user create "${WP_REGULAR_USER}" "${WP_REGULAR_EMAIL}" --path=/var/www/html/wordpress --role=subscriber --user_pass="${WP_REGULAR_PASS}""
# fi

# exec php-fpm7.4 -F

sleep infinity

# problem with mysql

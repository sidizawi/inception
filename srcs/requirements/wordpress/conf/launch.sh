# exit on errror
set -e

echo $(curl -s https://api.wordpress.org/secret-key/1.1/salt/) >> wp-config.php

envsubst < wp-config.php > wp-config.php.tmp
sed -E 's/\{\{\s*([A-Za-z_][A-Za-z0-9_]*)\s*\}\}/\$\1/g' "wp-config.php.tmp" > /var/www/html/wp-config.php

chmod 777 /var/www/html/wp-config.php
chown www-data:www-data /var/www/html/wp-config.php

rm wp-config.php.tmp

sed -i '/^listen = /c\listen = 0.0.0.0:9000' /etc/php/7.4/fpm/pool.d/www.conf
# sed -i '/php_admin_value[error_log]/c\php_admin_value[error_log] = \/var\/log\/php7.4-fpm.log' /etc/php/7.4/fpm/pool.d/www.conf

# echo "error_log = /var/log/php7.4-fpm.log" >> /etc/php/7.4/fpm/php.ini
# echo "chdir = /var/www/html" >> /etc/php/7.4/fpm/pool.d/www.conf
# echo "php_admin_flag[log_errors] = on" >> /etc/php/7.4/fpm/pool.d/www.conf

php-fpm7.4 -F

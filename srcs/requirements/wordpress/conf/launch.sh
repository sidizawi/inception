# exit on errror
set -e

export SECRETS=$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)

envsubst < wp-config.php > /var/www/wordpress/wp-config.php

mkdir -p /run/php/
chmod 777 /run/php/

php-fpm7.4 -F

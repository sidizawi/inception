# exit on errror
set -e

echo $(curl -s https://api.wordpress.org/secret-key/1.1/salt/) >> wp-config.php

envsubst < wp-config.php > /var/www/html/wp-config.php

echo "listen = 9000" >> /etc/php/7.4/fpm/pool.d/www.conf

php-fpm7.4 -t

php-fpm7.4 -F

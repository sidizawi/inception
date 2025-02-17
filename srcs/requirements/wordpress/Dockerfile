FROM debian:bullseye

VOLUME /var/www/html

WORKDIR /app
COPY ./conf .

RUN apt update \
	&& apt install -y php-fpm \
		php-mysql \
		php-redis \
		curl \
		mariadb-client \
		redis-tools \
	&& usermod -s /bin/bash www-data \
	&& mkdir -p /var/www \
	&& curl -O https://wordpress.org/latest.tar.gz \
	&& tar xzvf latest.tar.gz \
	&& rm latest.tar.gz \
	&& mkdir -p /var/www/.wp-cli/cache \
	&& chown -R www-data:www-data /var/www/.wp-cli \	
	&& cp wp-config.php wordpress \
	&& chown -R www-data:www-data wordpress \
	&& chmod -R 777 wordpress \
	&& mv wordpress /var/www/html \
	&& mkdir -p /run/php \
	&& chown -R www-data:www-data /run/php \
	&& curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x /usr/local/bin/wp \
	&& cp www.conf /etc/php/7.4/fpm/pool.d/www.conf \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 9000

ENTRYPOINT [ "bash", "start.sh" ]

# https://sidzawi.42.fr/wp-login.php

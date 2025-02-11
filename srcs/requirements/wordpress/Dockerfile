FROM debian:bullseye

VOLUME /var/www/html/wordpress

WORKDIR /var/www/html
# COPY ./conf/wp-config.php /var/www/html/wordpress
# COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./conf .

RUN apt update \
	&& apt install -y php-fpm \
		php-mysql \
		php-cli \
		php-curl \
		php-json \
		php-mbstring \
		php-xml \
		php-zip \
		curl \
		unzip \
		less \
		mariadb-client \
	&& usermod -s /bin/bash www-data \
	&& curl -O https://wordpress.org/latest.tar.gz \
	&& tar xzvf latest.tar.gz \
	&& rm latest.tar.gz \
	&& chown -R www-data:www-data wordpress \
	&& mkdir -p /run/php \
	&& chown -R www-data:www-data /run/php \
	&& curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x /usr/local/bin/wp \
	&& cp www.conf /etc/php/7.4/fpm/pool.d/www.conf \
	&& cp wp-config.php wordpress \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 9000

ENTRYPOINT [ "bash", "start.sh" ]

# https://sidzawi.42.fr/wp-login.php

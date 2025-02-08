FROM debian:bullseye

VOLUME /var/www/html/wordpress

WORKDIR /var/www/html

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
	&& curl -O https://wordpress.org/latest.tar.gz \
	&& tar xzvf latest.tar.gz \
	&& rm latest.tar.gz \
	&& chown -R www-data:www-data wordpress \
	&& mkdir -p /run/php \
	&& chown -R www-data:www-data /run/php \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 9000

COPY ./conf/wp-config.php /var/www/html/wordpress
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

ENTRYPOINT [ "php-fpm7.4", "-F" ]

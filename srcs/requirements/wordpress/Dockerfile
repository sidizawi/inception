FROM debian:bullseye

WORKDIR /app
COPY ./conf .

RUN apt update \
	&& apt install -y php7.4-fpm php-mysql unzip curl gettext \
	&& mkdir -p /var/www \
	&& cd /var/www/ \
	&& curl -O https://wordpress.org/latest.tar.gz \
	&& tar xzvf latest.tar.gz \
	&& rm latest.tar.gz \
	&& mv wordpress html \
	&& touch html/.htaccess \
	&& mkdir html/wp-content/upgrade \
	&& chown -R www-data:www-data html \
	&& find html/ -type d -exec chmod 750 {} \; \
	&& find html/ -type f -exec chmod 640 {} \; \
	&& mkdir -p /run/php \
	&& chmod 777 /run/php \
	&& chown www-data:www-data /run/php \
	# && chmod 777 /var/lib/php/sessions \
	# && chown -R www-data:www-data /var/lib/php/sessions \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 9000

ENTRYPOINT [ "bash", "launch.sh" ]

# todo: check: curl -s https://api.wordpress.org/secret-key/1.1/salt/
# https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lamp-on-debian-10

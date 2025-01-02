FROM debian:bullseye

WORKDIR /app
COPY ./conf .

RUN apt update \
	&& apt install -y php-fpm php-mysql unzip curl \
	&& mkdir -p /var/www\
	&& cd /var/www/ \
	&& curl -O https://wordpress.org/latest.tar.gz \
	&& tar xzvf latest.tar.gz \
	&& rm latest.tar.gz \
	&& touch wordpress/.htaccess \
	&& cp /app/wp-config.php wordpress/wp-config.php \
	&& mkdir wordpress/wp-content/upgrade \
	&& chown -R www-data:www-data wordpress\
	&& find wordpress/ -type d -exec chmod 750 {} \; \
	&& find wordpress/ -type f -exec chmod 640 {} \; \
	&& rm -rf /var/lib/apt/lists/*
	
EXPOSE 9000

ENTRYPOINT ["sleep", "infinity"]
#ENTRYPOINT ["php-fpm"]

# todo: check: curl -s https://api.wordpress.org/secret-key/1.1/salt/
# https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lamp-on-debian-10

FROM debian:bullseye

RUN apt update \
	&& apt install -y redis-server php-redis \
	&& echo "maxmemory 256mb" >> /etc/redis/redis.conf \
	&& echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf \
	&& sed -i '/^bind/c\bind 0.0.0.0 ::1' /etc/redis/redis.conf \
	&& sed -i '/^protected-mode/c\protected-mode no' /etc/redis/redis.conf \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 6379

ENTRYPOINT [ "redis-server" ]

# https://www.digitalocean.com/community/tutorials/how-to-configure-redis-caching-to-speed-up-wordpress-on-ubuntu-14-04
# https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-debian-10
# https://chemicloud.com/kb/article/redis-object-cache-in-wordpress/

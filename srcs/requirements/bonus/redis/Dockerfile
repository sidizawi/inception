FROM debian:bullseye

RUN apt update \
	&& apt install -y redis-server php-redis \
	&& echo "maxmemory 256mb" >> /etc/redis/redis.conf \
	&& echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf \
	&& sed -i '/^bind/c\bind 0.0.0.0' /etc/redis/redis.conf \
	&& sed -i '/^protected-mode/c\protected-mode no' /etc/redis/redis.conf \
	&& sed -i '/^# syslog-enabled/c\syslog-enabled yes' /etc/redis/redis.conf \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 6379

ENTRYPOINT [ "redis-server", "--protected-mode", "no" ]

# redis-cli info stats | grep -E '(keyspace_hits|keyspace_misses)'
# todo: finish it

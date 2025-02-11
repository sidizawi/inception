FROM debian:bullseye

WORKDIR /var/www/html/adminer

RUN apt update \
	&& apt install -y php php-mysql wget \
	&& wget -O /var/www/html/adminer/adminer.php \
		https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 8080

ENTRYPOINT [ "php", "-S", "0.0.0.0:8080", "adminer.php" ]

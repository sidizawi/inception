FROM debian:bullseye

WORKDIR /app
COPY ./conf .

RUN apt update \
	&& apt install -y php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 80

ENTRYPOINT ["php-fpm"]

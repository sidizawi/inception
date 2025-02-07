FROM debian:bullseye

RUN apt update \
	&& apt install -y nginx openssl \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt \
		-subj "/C=BE/ST=Brussels/L=Brussels/O=Organization/OU=Unit/CN=commonname" \
	&& openssl dhparam -out /etc/ssl/dhparam.pem 4096 \
	&& rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

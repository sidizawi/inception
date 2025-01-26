FROM debian:bullseye

WORKDIR /app
COPY conf/ .

RUN apt update \
	&& apt install -y nginx openssl \
	&& cp default /etc/nginx/sites-available/default \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 443

ENTRYPOINT [ "bash", "start.sh" ]

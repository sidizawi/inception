FROM debian:bullseye

WORKDIR /app
COPY ./conf .

RUN apt update \
	&& apt install -y nginx openssl gettext \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 443

ENTRYPOINT [ "bash", "launch.sh" ]

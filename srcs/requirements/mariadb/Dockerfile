FROM debian:bullseye

WORKDIR /app
COPY ./conf/ .

VOLUME /var/lib/mysql

RUN apt update \
	&& apt install -y mariadb-server \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 3306

ENTRYPOINT [ "bash", "start.sh" ]

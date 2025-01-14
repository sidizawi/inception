FROM debian:bullseye

WORKDIR /app
COPY ./conf .

RUN apt update \
	&& apt install -y mariadb-server net-tools \
	&& mv /var/lib/mysql /var/lib/mysql_backup \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 3306

ENTRYPOINT [ "bash", "launch.sh" ]

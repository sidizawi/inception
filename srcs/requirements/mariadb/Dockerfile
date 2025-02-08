FROM debian:bullseye

VOLUME /var/lib/mysql

WORKDIR /app
COPY ./conf/ .

RUN apt update \
	&& apt install -y mariadb-server \
	&& mv ./my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 3306

ENTRYPOINT [ "bash", "start.sh" ]

FROM debian:bullseye

WORKDIR /app
COPY ./conf .

RUN apt update \
	&& apt install -y mariadb-server \
	&& service mariadb start \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 3306

ENTRYPOINT [ "bash", "launch.sh" ]

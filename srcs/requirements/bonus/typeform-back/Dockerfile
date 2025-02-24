FROM debian:bullseye

WORKDIR /app
COPY requirements.txt .
COPY . .

RUN apt update \
	&& apt install -y python3 \
	python3-pip \
	pkg-config \
	python3-dev \
	default-libmysqlclient-dev \
	build-essential \
	mariadb-client \
	&& pip install -r requirements.txt \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 8081

ENTRYPOINT [ "bash", "start.sh" ]

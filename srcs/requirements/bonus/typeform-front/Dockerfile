FROM debian:bullseye

VOLUME /app

WORKDIR /app
COPY ./package*.json .
COPY . .

RUN apt update \
	&& apt install -y curl \
	&& curl -fsSL https://deb.nodesource.com/setup_20.x | bash -  \
	&& apt install -y nodejs \
	&& npm install \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 8082

ENTRYPOINT [ "npm", "run", "dev" ]

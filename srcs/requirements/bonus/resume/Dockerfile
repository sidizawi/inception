FROM debian:bullseye AS builder

WORKDIR /app
COPY ./resume/package*.json .
COPY ./resume .

RUN apt update \
	&& apt install -y curl \
	&& curl -fsSL https://deb.nodesource.com/setup_20.x | bash -  \
	&& apt install -y nodejs \
	&& npm install \
	&& npm run build \
	&& rm -rf /var/lib/apt/lists/*

FROM debian:bullseye

WORKDIR /app
COPY --from=builder /app/dist .

RUN apt update \
	&& apt install -y python3 \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 8000

ENTRYPOINT [ "python3", "-m", "http.server", "8000" ]

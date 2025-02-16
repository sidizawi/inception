FROM debian:bullseye

VOLUME /app
WORKDIR /app
COPY ./index.html .

RUN apt update \
	&& apt install -y python3 \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 8000

ENTRYPOINT [ "python3", "-m", "http.server", "8000" ]

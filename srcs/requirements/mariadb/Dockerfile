FROM debian:bullseye

WORKDIR /app
COPY ./conf .
RUN chmod +x configure.sh && ./configure.sh

ENTRYPOINT [ "sleep", "infinity" ]

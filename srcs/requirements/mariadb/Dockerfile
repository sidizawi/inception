FROM debian:bullseye

WORKDIR /app
COPY ./conf .
RUN chmod +x configure.sh && ./configure.sh

EXPOSE 3306

ENTRYPOINT [ "mysqld" ]

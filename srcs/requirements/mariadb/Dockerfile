FROM debian:bullseye

WORKDIR /app
COPY ./conf .
RUN chmod +x setup.sh && ./setup.sh

EXPOSE 3306

ENTRYPOINT [ "mysqld" ]

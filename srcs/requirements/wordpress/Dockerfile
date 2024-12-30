FROM debian:bullseye

WORKDIR /app
COPY ./conf .
RUN chmod +x setup.sh && ./setup.sh

EXPOSE 80

ENTRYPOINT ["php-fpm"]

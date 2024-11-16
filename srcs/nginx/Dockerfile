FROM debian:bullseye

RUN apt update && apt install -y nginx && service nginx start

EXPOSE 80

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

FROM debian:bullseye

WORKDIR /app
COPY ./conf .
RUN chmod +x configure.sh && ./configure.sh
COPY ./conf/default /etc/nginx/site-available/default
EXPOSE 80

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

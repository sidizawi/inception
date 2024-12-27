FROM debian:bullseye

WORKDIR /app
COPY ./conf .
RUN chmod +x configure.sh && ./configure.sh

EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

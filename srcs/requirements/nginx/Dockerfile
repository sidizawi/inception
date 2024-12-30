FROM debian:bullseye

WORKDIR /app
COPY ./conf .
RUN chmod +x setup.sh && ./setup.sh

EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

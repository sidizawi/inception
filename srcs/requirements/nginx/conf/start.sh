#!/bin/bash

set -e

mkdir -p /etc/nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt <<EOF
BE
Brussels
Brussels





EOF

openssl dhparam -out /etc/nginx/dhparam.pem 2048


nginx -t

nginx -g "daemon off;"

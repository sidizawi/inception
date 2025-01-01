# exit on error
set -e

# configure
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout $SSL_KEY \
	-out $SSL_CERT <<EOF
BE
Brussels
Brussels




EOF

openssl dhparam -out $DHPARAM 2048

chmod 600 $SSL_KEY
chmod 644 $SSL_CERT

# cp nginx.conf /etc/nginx/nginx.conf
envsubst < nginx.conf > /etc/nginx/nginx.conf

nginx -t

nginx -g "daemon off;"

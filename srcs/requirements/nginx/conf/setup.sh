# exit on error
set -e

# update and installing nginx
apt update
apt install -y nginx openssl

# configure
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt <<EOF
BE
Brussels
Brussels




EOF

openssl dhparam -out /etc/nginx/dhparam.pem 2048

chmod 600 /etc/ssl/private/nginx-selfsigned.key
chmod 644 /etc/ssl/certs/nginx-selfsigned.crt

# cp default /etc/nginx/sites-available/dafault
cp nginx.conf /etc/nginx/nginx.conf

# starting nginx
service nginx start

nginx -t

# remove cache
rm -rf /var/lib/apt/lists/*

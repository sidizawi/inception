# update and installing nginx
apt update
apt install -y nginx openssl

# configure
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt < sslinfo

openssl dhparam -out /etc/nginx/dhparam.pem 2048

cp default /etc/nginx/site-available/dafault

# starting nginx
service nginx start

# remove cach
rm -rf /var/lib/apt/lists/*

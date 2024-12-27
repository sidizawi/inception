# exit on errror
set -e

# update and install
apt update
apt install -y mariadb-server

service mariadb start

# configure
mysql_secure_installation <<EOF
{{ MYSQL_PASSWD }}
n
n
Y
n
Y
Y
EOF
# {{ mysql_password }}
# n # unit_socket
# n # root passwd
# Y # remove anonymous users
# n # dissalow root login remote
# Y # remove test db
# Y # reload

service mariadb start # why is it stopped?

# remove cache
rm -rf /var/lib/apt/lists/*

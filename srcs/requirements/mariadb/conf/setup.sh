# exit on errror
set -e

# update and install
apt update
apt install -y mariadb-server

service mariadb start

# configure
mysql_secure_installation <<EOF
$MYSQL_PASSWD
n
n
Y
n
Y
Y
EOF
# Test 
# n # unit_socket
# n # root passwd
# Y # remove anonymous users
# n # dissalow root login remote
# Y # remove test db
# Y # reload

# remove cache
rm -rf /var/lib/apt/lists/*

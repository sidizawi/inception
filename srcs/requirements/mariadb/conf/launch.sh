# exit on errror
set -e

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
# n # unit_socket
# n # root passwd
# Y # remove anonymous users
# n # dissalow root login remote
# Y # remove test db
# Y # reload

echo $MYSQL_PASSWD > test

mysqld
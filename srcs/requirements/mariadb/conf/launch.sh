# exit on errror
set -e

if [ ! -d "/var/lib/mysql_backup" ]
then
	echo "no backup"
	exit 1
fi

if [ ! -d "/var/lib/mysql/mysql" ]
then
	echo "no mysql"
	cp -r /var/lib/mysql_backup /var/lib/mysql
	chown -R mysql:mysql /var/lib/mysql
fi

echo "Initializing MariaDB data directory..."

mysqld_safe --skip-networking &

while netstat -tulpn | grep LISTEN | grep 3306
do
	echo "Waiting for MariaDB to listen on port 3306..."
	sleep 2
done

while ! mysqladmin ping --silent --user=root --password="$MYSQL_ROOT_PASSWORD"
do
	echo "Waiting for MariaDB to be fully ready..."
	sleep 2
done

echo "MariaDB is up and running!"

# root user
# todo: add if not exist for create database
mysql <<EOF
GRANT ALL ON *.* TO '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
CREATE DATABASE $WORDPRESS_DB;
CREATE USER '$WORDPRESS_ROOT'@'localhost' IDENTIFIED BY '$WORDPRESS_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON wordpress.* TO '$WORDPRESS_ROOT'@'localhost';
FLUSH PRIVILEGES;
EOF

mysqladmin shutdown --user=root --password="$MYSQL_ROOT_PASSWORD"

mysqld
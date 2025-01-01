# exit on errror
set -e

# if [ ! -d "/var/lib/mysql_backup" ]
# then
# 	echo "no backup"
# 	exit 1
# fi

# if [ ! -d "/var/lib/mysql/mysql" ]
# then
# 	echo "no mysql"
# 	cp -r /var/lib/mysql_backup /var/lib/mysql
# 	chown -R mysql:mysql /var/lib/mysql
# fi

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
mysql <<EOF
GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

mysqladmin shutdown --user=root --password="$MYSQL_ROOT_PASSWORD"

mysqld
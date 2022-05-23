#!bin/bash

sed -ie 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -ie 's/#port/port/g'        /etc/mysql/mariadb.conf.d/50-server.cnf

chown -R mysql:mysql /var/lib/mysql

if [ ! -d /var/lib/mysql/$DB_NAME ]
then
service mysql start
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -u root -p$DB_ROOT_PASSWORD
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;" | mysql -u root -p$DB_ROOT_PASSWORD
echo "FLUSH PRIVILEGES;" | mysql -u root -p$DB_ROOT_PASSWORD
mysqladmin -u root -p password $DB_ROOT_PASSWORD

service mysql stop
fi

mysqld_safe

#!/bin/bash

if [ ! -f /var/www/html/wordpress/wp-config.php ]
then
service php7.3-fpm start

wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
rm latest.tar.gz

chown -R www-data:www-data /var/www/html/wordpress
cp -r wp-config.php /var/www/html/wordpress/wp-config.php

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /bin/wp
chmod +x /bin/wp

wp core install --url="$DOMAIN_NAME" --title="INCEPTION" --admin_user="$WP_ADMIN" \
	--admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_MAIL" --path="/var/www/html/wordpress/" --allow-root
wp user create $WP_USER $WP_USER@$DOMAIN_NAME --role="author" \
	--user_pass="$WP_PWD" --path="/var/www/html/wordpress/" --allow-root

else
echo "wordpress ready to go"

fi

/usr/sbin/php-fpm7.3 -F

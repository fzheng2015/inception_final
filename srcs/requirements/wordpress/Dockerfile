from debian:buster

run apt-get update && apt-get -y install wget
run apt-get -y install php
run apt-get -y install php-cli
run apt-get -y install php-mbstring
run apt-get -y install php7.3-fpm
run apt-get -y install php7.3-cgi
run apt-get -y install php7.3-mysql
run apt-get -y install vim
run apt-get -y install mariadb-client

run sed -ie 's/listen = \/run\/php\/php7.3-fpm.sock/listen = wordpress:9000/g' \
		etc/php/7.3/fpm/pool.d/www.conf

expose 9000
workdir ./var/www/html/
copy tools/* tmp/
copy conf/* ./
run mkdir /run/php
cmd ["bash", "tmp/wordpress_start.sh"]

from debian:buster

run apt-get update && apt-get -y install nginx vim openssl

run openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/CN=localhost" \
		-keyout localhost.dev.key -out localhost.dev.crt
run mv localhost.dev.crt etc/ssl/certs/
run mv localhost.dev.key etc/ssl/private/
run chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key

copy conf/default /etc/nginx/sites-available/default

expose 443

cmd ["nginx", "-g", "daemon off;"]

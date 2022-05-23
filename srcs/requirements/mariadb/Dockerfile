from debian:buster

run apt-get update && apt-get -y install mariadb-server vim

expose 3306

copy /tools/start.sh tmp/

cmd bash /tmp/start.sh

#!bin/bash

apt update && apt upgrade -y
apt install nginx openssl -y
apt install iputils-ping -y

mv /etc/nginx/nginx.conf etc/nginx/nginx.conf_backup
mv nginx.conf /etc/nginx/.

mkdir -p /etc/nginx/ssl
apt install openssl -y 
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/certificate.key -out /etc/nginx/ssl/certificate.crt -subj $DISTINGUISHED_NAME
mkdir -p /var/www/wordpress
chmod 755 /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress

nginx -g "daemon off;"
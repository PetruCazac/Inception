#!bin/bash

apt update && apt upgrade -y
apt install nginx -y 
mv /etc/nginx/nginx.conf etc/nginx/nginx.conf_backup
mv nginx.conf /etc/nginx/.
rm nginx.conf
mkdir -p /etc/nginx/ssl
apt install openssl -y 
# openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/certificate.key -out /etc/nginx/ssl/certificate.crt -subj "/C=DE/ST=BW/L=HB/O=42/OU=42HB/CN=pcazac"
# chmod 755 /var/www/html
# chown -R www-data:www-data /var/www/html

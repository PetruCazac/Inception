#!bin/bash

apt update && apt upgrade -y
apt install nginx -y 
mv etc/nginx/nginx.conf etc/nginx/nginx.conf_backup
mv nginx.conf etc/nginx/.
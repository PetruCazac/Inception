#!/bin/bash
set -e

apt update && apt upgrade -y
apt install -y php
apt install -y php-fpm php-mysql php-curl
apt install wget -y
apt install unzip -y
# apt install mariadb-client -y

mkdir -p /var/www
mkdir -p /var/www/html
mkdir -p /run/php && chown www-data:www-data /run/php

wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz -C /var/www/html

mv /wp-config.php /var/www/html
mv /www.conf /etc/php/7.4/fpm/pool.d
mv /var/www/html/wordpress/* /var/www/html

rm -rf /var/www/html/wordpress
rm -f latest.tar.gz


apt install vim -y

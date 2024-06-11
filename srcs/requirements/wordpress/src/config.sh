#!/bin/bash
# set -e
#
apt update && apt upgrade -y
apt install curl -y
apt install wget -y
apt install iputils-ping -y

apt install apt-transport-https
curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ bullseye main" > /etc/apt/sources.list.d/php.list'
apt update && apt upgrade -y

apt install php8.3-common php8.3-cli php8.3-fpm php8.3-mysql php8.3-{curl,bz2,mbstring,intl} -y
apt install mariadb-client -y

apt install vim -y

mkdir -p ${WP_PATH}

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

sed -i "s/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/" etc/php/8.3/fpm/pool.d/www.conf

wp core download --path=${WP_PATH} --allow-root

rm -f /etc/php/8.3/fpm/pool.d/www.conf
mv ./www.conf /etc/php/8.3/fpm/pool.d/.

cd ${WP_PATH}

echo "Creating the config"
wp config create --allow-root --dbname=${DATABASE_NAME} --dbuser=${DATABASE_USER} --dbpass=${DATABASE_PASSWORD} --dbhost=mariadb:3306

echo "Installing the WP core"
wp core install  --allow-root --url=${DOMAIN_NAME} --title=${WEB_TITLE} --admin_user=${USER} --admin_password=${PASSWORD} --admin_email=${ADMIN_EMAIL}

wp user create --allow-root --url=${DOMAIN_NAME} ${NEW_USERNAME} ${NEW_USER_EMAIL} --user_pass=${USER_PASSWORD} 

mkdir -p /run/php
chown -R www-data:www-data /run/php

/usr/sbin/php-fpm8.3 -F
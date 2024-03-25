#!bin/bash

apt update && apt upgrade -y
apt install php-fpm php-mysql php-curl -y
apt install wget -y
apt install unzip -y
apt install mariadb-client -y

wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz -C /var/
rm latest.tar.gz

mv /wp-config.php /var/wordpress/.

apt install vim -y


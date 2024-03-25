#!bin/bash

apt update && apt upgrade -y
apt install mariadb-server -y
apt install systemctl -y
mv /etc/mysql/mariadb.conf.d/50-server.cnf /etc/mysql/mariadb.conf.d/50-server_backup.cnf
mv /50-server.cnf /etc/mysql/mariadb.conf.d/.
service mariadb start
sleep 1


mysql -e "CREATE DATABASE ${DATABASE_NAME};"
mysql -e "CREATE USER ${DATABASE_USER}@'localhost' IDENTIFIED BY ${DATABASE_PASSWORD};"
mysql -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO ${DATABASE_USER}@'localhost';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DATABASE_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p $DATABASE_ROOT_PASSWORD shutdown
service mariadb start
sleep 1
# mysqladmin -u root -p $DATABASE_ROOT_PASSWORD start

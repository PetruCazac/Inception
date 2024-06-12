#!/bin/bash

service mariadb start
sleep 5

echo "Creating database $DATABASE_NAME"
mysql -uroot -p$DATABASE_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};"
echo "creating a user"
mysql -uroot -p$DATABASE_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '{$DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_PASSWORD}';"
echo "grant priviledges"
mysql -uroot -p$DATABASE_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_PASSWORD}';"
echo "Alter rootpass"
mysql -uroot -p$DATABASE_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DATABASE_ROOT_PASSWORD}';"
echo "Alter user"
mysql -uroot -p$DATABASE_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${DATABASE_ROOT_PASSWORD}' WITH GRANT OPTION;"
echo "Flushing privileges"
mysql -uroot -p"$DATABASE_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p"$DATABASE_ROOT_PASSWORD" shutdown
mysqld_safe

#!/bin/bash

mysql -e "CREATE DATABASE $DATABASE_NAME;"
mysql -e "CREATE USER $USER@$DOMAIN_NAME IDENTIFIED BY $PASSWORD;"
mysql -e "GRANT ALL PRIVILEGES ON mydatabase.* TO 'myuser'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"
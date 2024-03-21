#!bin/bash

apt get update && apt get install -y nginx
apt install -y ufw
sudo ufw allow 'Nginx HTTP'


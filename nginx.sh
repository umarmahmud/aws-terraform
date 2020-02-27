#!bin/bash

apt update
apt install nginx
apt install ufw

ufw allow 'Nginx HTTP'
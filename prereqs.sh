#!/bin/bash

# to run
# ssh root@_secret_ip_
# curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/prereqs.sh
# ./drone.sh

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce

mkdir /usr/local/bin/docker-compose
# docker-compose
curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

# nginx
sudo apt-get install -y nginx
sudo ufw allow 'Nginx Full'
sudo ufw allow ssh
sudo ufw enable
sudo ufw status
sudo systemctl status nginx

# nginx, HTTPS /w lets encrypt
# note, need a domain - get one from freenom
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt-get update
sudo apt-get install python-certbot-nginx -y
sed -i 's/server_name _/server_name groklemins.tk drone.groklemins.tk/' /etc/nginx/sites-available/default
sudo nginx -t
sudo systemctl reload nginx
sudo certbot --nginx -d groklemins.tk --no-redirect --register-unsafely-without-email --agree-tos
sudo certbot renew --dry-run

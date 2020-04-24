#!/bin/bash

# to run
# ssh root@_secret_ip_
# curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/prereqs.sh
# ./drone.sh

# purge first!
sudo apt-get purge -y nginx nginx-common

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce

# docker-compose
sudo rm /usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# nginx
sudo apt-get install -y nginx
sudo ufw allow 'Nginx Full'
sudo ufw allow ssh
sudo ufw --force enable
sudo ufw status
sudo systemctl status nginx

# nginx, use our defined default file instead
sudo mv /etc/nginx/sites-enabled/default /etc/nginx/sites-available
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/fixtures/sites_enabled.default
sudo mv sites_enabled.default /etc/nginx/sites-enabled/default

# nginx, HTTPS /w lets encrypt
# note, need a domain - get one from freenom
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt-get update -y
sudo apt-get install python-certbot-nginx -y
sudo nginx -t
sudo systemctl reload nginx
sudo certbot --nginx -d groklemins.tk --keep-until-expiring --no-redirect --register-unsafely-without-email --agree-tos
# sudo certbot renew --dry-run

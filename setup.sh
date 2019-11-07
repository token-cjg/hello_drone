#!/bin/bash

# get drone!
docker pull drone/drone:1.6.1
sudo mkdir /etc/drone
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/fixtures/docker-compose.yml
sudo mv docker-compose.yml /etc/drone/docker-compose.yml
DRONE_SECRET=$(LC_ALL=C </dev/urandom tr -dc A-Za-z0-9 | head -c 65 && echo)
touch /etc/drone/server.env
cat << EOF > /etc/drone/server.env
# Service settings
DRONE_SECRET=$DRONE_SECRET
DRONE_HOST=https://groklemins.tk

# Registration settings
DRONE_OPEN=false
DRONE_ADMIN=token-cjg

# GitHub Settings
DRONE_GITHUB=true
DRONE_GITHUB_CLIENT=Client_ID_from_GitHub
DRONE_GITHUB_SECRET=Client_Secret_from_GitHub
EOF
touch /etc/drone/agent.env
cat << EOF > /etc/drone/agent.env
DRONE_SECRET=$DRONE_SECRET
DRONE_SERVER=wss://groklemins.tk/ws/broker
EOF
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/fixtures/drone.service
sudo mv drone.service /etc/systemd/system/drone.service

curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/fixtures/sites_enabled.default
sudo mv sites_enabled.default /etc/nginx/sites-enabled/default

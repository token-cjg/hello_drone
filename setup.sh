#!/bin/bash

# get drone!
sudo docker pull drone/drone:1.7.0
sudo mkdir /etc/drone
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/fixtures/docker-compose.yml
sudo mv docker-compose.yml /etc/drone/docker-compose.yml
DRONE_SECRET=$(LC_ALL=C </dev/urandom tr -dc A-Za-z0-9 | head -c 65 && echo)
sudo touch /etc/drone/server.env
sudo bash -c 'cat << EOF > /etc/drone/server.env
# Service settings
DRONE_RPC_SECRET=$DRONE_SECRET
DRONE_SERVER_HOST=groklemins.tk
DRONE_SERVER_PROTO=https
DRONE_RUNNER_CAPACITY=3
DRONE_TLS_AUTOCERT=false

# Registration settings
DRONE_OPEN=false
DRONE_ADMIN=token-cjg

# GitHub Settings
DRONE_GITHUB_SERVER=https://github.com
DRONE_GITHUB_CLIENT_ID=Client_ID_from_GitHub
DRONE_GITHUB_CLIENT_SECRET=Client_Secret_from_GitHub
EOF'
sudo touch /etc/drone/agent.env
sudo bash -c 'cat << EOF > /etc/drone/agent.env
DRONE_RPC_SECRET=$DRONE_SECRET
DRONE_RPC_SERVER=wss://groklemins.tk/ws/broker
DRONE_RUNNER_CAPACITY=3
EOF'
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/fixtures/drone.service
sudo mv drone.service /etc/systemd/system/drone.service

# curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/fixtures/sites_enabled.default
# sudo mv sites_enabled.default /etc/nginx/sites-enabled/default

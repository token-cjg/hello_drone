#!/bin/bash

# get drone!
sudo docker pull drone/drone:1.6.5
sudo docker pull drone/drone-runner-docker:1.3.0
sudo rm -rf /etc/drone
sudo mkdir /etc/drone
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/fixtures/docker-compose.yml
sudo mv docker-compose.yml /etc/drone/docker-compose.yml
DRONE_SECRET=$(LC_ALL=C </dev/urandom tr -dc A-Za-z0-9 | head -c 65 && echo)
sudo touch /etc/drone/server.env
sudo bash -c "cat << EOF > /etc/drone/server.env
# GitHub Settings
DRONE_RPC_SECRET=$DRONE_SECRET
DRONE_GITHUB_CLIENT_ID=$1
DRONE_GITHUB_CLIENT_SECRET=$2
EOF"
sudo touch /etc/drone/agent.env
sudo bash -c "cat << EOF > /etc/drone/agent.env
DRONE_RPC_SECRET=$DRONE_SECRET
EOF"
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/fixtures/drone.service
sudo mv drone.service /etc/systemd/system/drone.service

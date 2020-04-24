#!/bin/bash

curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/prereqs.sh
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/setup.sh
curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/start.sh

sudo chmod +x ./prereqs.sh
sudo chmod +x ./setup.sh
sudo chmod +x ./start.sh

bash prereqs.sh
bash setup.sh
bash start.sh

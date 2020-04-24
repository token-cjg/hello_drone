#!/bin/bash

# only do this after manually adding your secrets
# to /etc/drone/server.env
# you can find these in your github oauth drone app

# check nginx configuration and restart
sudo nginx -t
sudo systemctl restart nginx
sudo systemctl daemon-reload
# start drone!
sudo systemctl restart drone
# sudo systemctl status drone
sudo systemctl enable drone

#!/bin/bash

# only do this after manually adding your secrets
# to /etc/drone/server.env
# you can find these in your github oauth drone app

# check nginx configuration and restart
sudo nginx -t
sudo systemctl restart nginx

# start drone!
sudo systemctl start drone
sudo systemctl status drone
sudo systemctl enable drone

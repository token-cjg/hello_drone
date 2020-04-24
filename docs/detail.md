### Troubleshooting

* `sudo apt-get purge nginx nginx-common`, then run `./prereqs.sh` again

### Setting up nginx, docker, and certbot

* `ssh root@ip`
* `curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/prereqs.sh`
* `./prereqs.sh`

### Setting up drone

* Set up an OAuth application per https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-drone-on-ubuntu-16-04
* `curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/setup.sh`
* `./setup.sh`

Then

* fill in environment variables from github application (`sudo vim /etc/drone/server.env`)
* `curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/start.sh`
* `./start.sh`
* wait for several minutes for docker to come up
* visit https://groklemins.tk
* profit!

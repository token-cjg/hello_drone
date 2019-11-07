[![Build Status](https://groklemins.tk/api/badges/token-cjg/hello_drone/status.svg)](https://groklemins.tk/token-cjg/hello_drone)

### Reference

From the guide https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-drone-on-ubuntu-16-04

### Instructions

* Use freenom to get a domain
* Use digitalocean to get a VM
* Use cloudflare to do routing
* Point freenom domain to cloudflare nameservers
* On cloudflare point to VM ip
* On cloudflare issue a CAA to letsencrypt.org
* Stir vigorously
* Leave mixture to sit for 72 hours

### Setting up nginx, docker, and certbot

* ssh root@ip
* curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/prereqs.sh
* ./prereqs.sh

### Setting up drone

* Set up an OAuth application per https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-drone-on-ubuntu-16-04
* curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/setup.sh
* ./setup.sh

Then

* fill in environment variables from github application
* curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/start.sh
* wait for several minutes for docker to come up
* visit https://groklemins.tk
* profit!

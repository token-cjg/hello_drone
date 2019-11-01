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
* curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/drone.sh
* ./drone.sh

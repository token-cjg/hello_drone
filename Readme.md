### Instructions

* Use freenom to get a domain
* Use digitalocean or azure to get a VM
* Use cloudflare to do routing
* Point freenom domain to cloudflare nameservers
* On cloudflare point to VM ip
* On cloudflare issue a CAA to letsencrypt.org
* Stir vigorously
* Leave mixture to sit for 72 hours

### Gotchas

* Make sure that your domain is resolving first, otherwise certbot will complain!
* Make sure port 80 is open on your machine, otherwise again certbot won't work
* `sudo certbot certonly --standalone -d groklemins.tk`

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

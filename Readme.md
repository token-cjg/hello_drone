### Before you start...

* Use freenom to get a domain
* Use digitalocean or azure to get a VM
* Use cloudflare to do routing
* Point freenom domain to cloudflare nameservers
* On cloudflare point to VM ip
* On cloudflare issue a CAA to letsencrypt.org
* Stir vigorously
* Leave mixture to sit for 72 hours

### Quickstart

1. `curl -O -L https://raw.githubusercontent.com/token-cjg/hello_drone/master/bootstrap.sh`
1. `chmod +x bootstrap.sh`
1. `./bootstrap.sh $DRONE_GITHUB_CLIENT_ID $DRONE_GITHUB_CLIENT_SECRET`
1. wait for docker (several minutes)
1. visit your.server.com # eg https://groklemins.tk

### Gotchas

* Make sure that your domain is resolving first, otherwise certbot will complain!
* Make sure port 80 is open on your machine, otherwise again certbot won't work
* Make sure port 8000 is open on your machine, otherwise drone won't work.
* `sudo certbot certonly --standalone -d groklemins.tk`

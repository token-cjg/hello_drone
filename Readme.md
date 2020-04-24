### Before you start...

... you will need a VM and sort out Cloudflare routing etc.

See instructions [here](docs/prerequisities.md).

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

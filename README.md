Configuration to setup a small server on my rpi within lan.

### Setup
- followed this [tutorial](https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71) and his [code on github](https://github.com/wmnnd/nginx-certbot)
1. make build
2. adapt nginx.conf (do not yet add https redirect and routes)
3. run init-letsencrypt.sh
4. add http->https redirect and https routes
5. docker-compose up --force-recreate -d nginx

### Troubleshooting
If the init script results in errors, you can check the following:
- verify that the container works, ie docker exec -ti certbot /bin/bash
- return init script after the creation of dummy certificates and check if the website still works
- check if .well-known/acme-challenge is accessible
- verify that all certificates are generated in data/certbot/conf/live/
- make nginx.conf work; make terminal; adapt config and test with nginx -t
- ensure ensure http://<domain>/.well-known/acme-challenge/ is working!
- ensure domain is resolving correctly with a record in [unboundtest](https://unboundtest.com/)
- ensure dnssec is setup for your domain
- re-add redirects, run make nginx
- if certificate was not renewed (eg ip change):
  - comment configs with 443 settings and redirects in nginx.conf
  - run ./init-letsencrypt.sh (you might uncomment some domains in the script)
  - uncomment changes above
  - make nginx

### Commands
```
docker-compose up --force-recreate -d nginx # reload configuration
or
make nginx
```

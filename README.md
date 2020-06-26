Configuration to setup a small server on my rpi within lan.

### Setup
- followed this [tutorial](https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71) and his [code on github](https://github.com/wmnnd/nginx-certbot)
1. modify configuration, especially urls (see also comments in nginx.conf
2. run his script ./init-letsencrypt.sh
3. docker-compose up -d


### Troubleshooting
If the init script results in errors, you can check the following:
- verify that the container works, ie docker exec -ti certbot /bin/bash
- return init script after the creation of dummy certificates and check if the website still works
- check if .well-known/acme-challenge is accessible

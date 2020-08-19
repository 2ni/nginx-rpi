terminal:
	docker exec -it nginx /bin/bash

build:
	docker-compose up -d --build

nginx:
	docker-compose up --force-recreate -d nginx

list:
	docker container ls -a

clean:
	docker system prune

cleanall:
	docker system prune --volumes

TAG = proxy-server
NAME = psycho
CONTAINER.ID = $(shell docker ps -a | grep -F $(NAME) | awk '{print $$1;}')
CONTAINER.CMD = $(shell if [ "" != "$(CONTAINER.ID)" ]; then $1; fi )


.SILENT: test
test:

log:
	docker logs -f $(NAME)

start:
	docker start $(NAME)

stop:
	docker stop $(NAME)

ssh:
	docker exec -it $(NAME) bash
#	docker exec -it `docker ps -ql` bash

build:
	docker build --tag $(TAG) .

delete:
	echo $(call CONTAINER.CMD,docker rm -f $(NAME))

create: delete
	docker build --tag $(TAG) .
	docker run -d -p 8080:80 --name $(NAME) $(TAG)

rm: stop
	docker rm $(NAME)
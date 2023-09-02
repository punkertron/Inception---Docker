DC = docker-compose
DC_FILE = ./srcs/docker-compose.yaml
DIRS = /home/drohanne/data/wordpress /home/drohanne/data/mariadb

all:	down | ${DIRS}
	${DC} -f ${DC_FILE} up --build -d

${DIRS}:
	sudo mkdir -p ${DIRS}

ps:
	${DC} -f ${DC_FILE} ps -a

down:
	${DC} -f ${DC_FILE} down

clean:
	docker stop $$(docker ps -a -q);\
	docker system prune -a --force;\
	docker volume prune --force;\
	docker network prune --force


fclean: clean
	sudo rm -rf ${DIRS}

re: clean all

.PHONY: all ps down clean fclean re

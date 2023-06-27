DC = docker-compose
DC_FILE = ./srcs/docker-compose.yaml

all:	down
	${DC} -f ${DC_FILE} up --build -d

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
	sudo rm -rf /home/drohanne/data/wordpress/* /home/drohanne/data/mariadb/*

re: clean all

.PHONY: all ps down clean fclean re

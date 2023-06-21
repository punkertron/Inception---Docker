DC = docker-compose
DC_FILE = ./srcs/docker-compose.yaml

all:
	${DC} -f ${DC_FILE} up --build -d

ps:
	${DC} -f ${DC_FILE} ps -a

down:
	${DC} -f ${DC_FILE} down

clean:
	docker stop $$(docker ps -a -q);\
	docker system prune -a --force --volumes

fclean: clean

re: clean all

.PHONY: all ps down clean fclean

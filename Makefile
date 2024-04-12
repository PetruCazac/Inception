NAME = build

all: $(NAME)

$(NAME):
	sudo docker compose -f ./srcs/docker-compose.yml up --build

word:
	sudo docker build -t word ./srcs/requirements/wordpress/.
	sudo docker run --name word -it word bash

clear_w:
	sudo docker rm word
	sudo docker rmi word


wordr:
	sudo docker rm word
	sudo docker rmi word
	sudo docker build -t word ./srcs/requirements/wordpress/.
	sudo docker run --name word -it word bash
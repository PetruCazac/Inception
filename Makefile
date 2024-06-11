NAME = build

all: $(NAME)

$(NAME):
	cp srcs/.env srcs/requirements/mariadb/.
	cp srcs/.env srcs/requirements/wordpress/.
	sudo docker compose -f ./srcs/docker-compose.yml up --build -d

cstatus:
	@echo "\e[32mStatus of the processes:\e[37m"
	@sudo docker ps -a 

istatus:
	@echo "\e[32mStatus of the images:\e[37m"
	@sudo docker images -a 

nstatus:
	@echo "\e[32mStatus of the networks:\e[37m"
	@sudo docker network ls

vstatus:
	@echo "\e[32mStatus of the volumes:\e[37m"
	@sudo docker volume ls 

status: cstatus istatus nstatus vstatus

stop:
	@echo "\e[32mStopping the containers.\e[37m"
	sudo docker ps -q | xargs -r sudo docker stop

cclean:
	@echo "\e[32mClean the containers.\e[37m"
	sudo docker ps -a -q | xargs -r sudo docker rm

iclean:
	@echo "\e[32mClean the images.\e[37m"
	sudo docker images -q | xargs -r sudo docker rmi

nclean:
	@echo "\e[32mClean the networks.\e[37m"
	@for network_id in $(shell sudo docker network ls -q); do \
		network_name=$$(sudo docker network inspect --format '{{.Name}}' $$network_id); \
		if [ "$$network_name" != "bridge" ] && [ "$$network_name" != "host" ] && [ "$$network_name" != "none" ]; then \
			sudo docker network rm $$network_id; \
		fi \
	done

vclean:
	@echo "\e[32mClean the volumes.\e[37m"
	sudo docker volume ls -q | xargs -r sudo docker volume rm

clean: stop cclean iclean nclean vclean

re: clean remove_env all

terminate: remove_env remove-local-storage

remove_env:
	rm -f srcs/requirements/mariadb/.env
	rm -f srcs/requirements/wordpress/.env

remove-local-storage:
	sudo rm -rf ../data/files_wordpress/*
	sudo rm -rf ../data/files_db/*

.PHONY: all stop cclean iclean nclean vclean clean remove-local-storage remove_env terminate

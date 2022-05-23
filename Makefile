YML=./srcs/docker-compose.yml
USR=hzhou

all: up

up:
	@mkdir -p /home/$(USR)/data/db_vol/
	@mkdir -p /home/$(USR)/data/wp_vol/
	@docker-compose -f $(YML) up -d --build

run:
	@mkdir -p /home/$(USR)/data/db_vol/
	@mkdir -p /home/$(USR)/data/wp_vol/
	@docker-compose -f $(YML) up -d

stop:
	@docker-compose -f $(YML) stop

down:
	@docker-compose -f $(YML) down

ps:
	@docker-compose -f $(YML) ps

volume:
	@docker volume ls

re:
	down up

fclean: down
	@docker rmi -f $$(docker images -aq)

cleandata:
	@sudo rm -fr /home/$(USR)/data/db_vol/
	@sudo rm -fr /home/$(USR)/data/wp_vol/
	@docker volume rm $$(docker volume ls)

.PHONY: all up stop down ps re run fclean clean

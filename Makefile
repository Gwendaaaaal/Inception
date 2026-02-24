.PHONY: all clean fclean re

all :
	mkdir -p /home/gholloco/data/wordpress
	mkdir -p /home/gholloco/data/mariadb
	docker compose -f srcs/docker-compose.yml build
	docker compose -f srcs/docker-compose.yml up -d

clean :
	docker container stop nginx mariadb wordpress
	docker network rm srcs_inception

fclean : clean
	docker compose -f srcs/docker-compose.yml down -v
	docker system prune -af
	sudo rm -rf /home/gholloco/data/wordpress
	sudo rm -rf /home/gholloco/data/mariadb

logs :
	docker logs wordpress
	docker logs nginx
	docker logs mariadb

re : fclean all

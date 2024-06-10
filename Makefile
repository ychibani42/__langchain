all:
	docker compose -f ./docker-compose.yml build
	docker compose -f ./docker-compose.yml up -d 

build:
	docker compose -f ./docker-compose.yml build 

stop:
	docker compose -f ./docker-compose.yml stop || true

down:
	docker compose -f ./docker-compose.yml down || true

clean:
	docker compose -f ./docker-compose.yml down || true
	docker system prune -af || true

fclean: clean
	docker network rm $$(docker network ls -q) 2>/dev/null || true
	docker volume rm -f $$(docker volume ls -q) || true
	docker volume prune -f || true

re : fclean all

in_db:
	docker exec -it langchain-postgres-1 bash

log :
	docker compose -f ./docker-compose.yml logs
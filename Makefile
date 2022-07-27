up:
	docker-compose up -d

down:
	docker-compose down

build-no-cache: down
	docker-compose build --no-cache && \
	docker-compose up -d

build: down
	docker-compose up --build -d

config:
	cp src/.env.example src/.env

install: build-no-cache get-app get-deps

get-app:
	git clone --recurse-submodules https://github.com/angtheod/backend-assignment.git src

get-deps:
	docker-compose exec api composer install --working-dir=/var/www/html/src --prefer-dist

shell-api:
	docker-compose exec api bash

shell-db:
	docker-compose exec db bash

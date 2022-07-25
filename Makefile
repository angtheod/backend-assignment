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
	docker-compose exec api git submodule add https://github.com/angtheod/vessels-tracks-api src

get-deps:
	docker-compose exec api composer create-project --working-dir=/var/www/html/src --prefer-dist laravel/lumen

shell-api:
	docker-compose exec api bash

shell-db:
	docker-compose exec db bash

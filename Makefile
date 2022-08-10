SHELL := /bin/bash

up:
	docker-compose up -d

down:
	docker-compose down

build-no-cache: down
	docker-compose build --no-cache && \
	docker-compose up -d

build: down
	docker-compose up --build -d

install:
	build-no-cache
	app
	deps
	config
	migrate
	seed
	web-server

app:
	git submodule update --init

deps:
	docker-compose exec api composer install --working-dir=/var/www/html/src

deps-update:
	docker-compose exec api composer update --working-dir=/var/www/html/src

config:
	docker-compose exec api php -r "file_exists('src/.env') || copy('src/.env.example', 'src/.env');" && \
	docker-compose exec api sed -ir "s/^[#]*\s*APP_KEY=.*/APP_KEY=$$(php -r "require 'src/vendor/autoload.php'; echo \Illuminate\Support\Str::random(32).PHP_EOL;")/" src/.env

migrate:
	docker-compose exec api php src/artisan migrate:fresh

seed:
	docker-compose exec api php src/artisan db:seed

web-server:
	docker-compose exec api php -S api:8080 -t src/public

bash-app:
	docker-compose exec api bash

bash-db:
	docker-compose exec db bash

tests:
	src/vendor/phpunit/phpunit/phpunit --configuration=src/phpunit.xml src/tests

up:
	docker-compose up -d

down:
	docker-compose down

build-no-cache: down
	docker-compose build --no-cache && \
	docker-compose up -d

build: down
	docker-compose up --build -d

install: build-no-cache app deps

app:
	git submodule update --init

deps:
	docker-compose exec api composer install --working-dir=/var/www/html/src

bash-app:
	docker-compose exec api bash

bash-db:
	docker-compose exec db bash

tests:
	src/vendor/phpunit/phpunit/phpunit --configuration=src/phpunit.xml src/tests

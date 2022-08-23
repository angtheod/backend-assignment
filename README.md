## Build
Create directory with enough permissions (e.g. 775) and cd into it
```shell
git clone -b angelos --single-branch https://github.com/angtheod/backend-assignment.git .
make install
```
The make install command builds the containers (without cache), fetches the application code, installs dependencies,
configures the application, truncates tables and runs migrations, seeds database tables and finally
it starts the php built-in development web server which can be accessed at http://localhost:8081/


## Makefile extras
`make down`
Stop and remove containers and networks

`make up`
Start containers

`make build`
Re-build (with cache)

`make deps-update`
Update dependencies

`make migrate`
Truncate tables and run a fresh migration

`make seed`
Seed tables with data as defined within the application

`make web-server`
Start the php built-in web server

`make bash-app`
Enter app container's shell

`make bash-db`
Enter db container's shell

`make tests`
Run all PHPUnit tests

`make docs`
Create OpenApi v3 documentation


## Components
Docker 20.10.17 - Docker Compose v2.6.1 - PHP 8.1.5 - Lumen 9.1.0 - Mysql 8.0.29 - Composer 2.4

___________________________________________________________

# Vessels Tracks API

Your task is to create a **RESTful API** that serves vessel tracks from a raw vessel positions data-source.
The raw data is supplied as a JSON file that you must import to a database schema of your choice.

Fields supplied are:
* **mmsi**: unique vessel identifier
* **status**: AIS vessel status
* **station**: receiving station ID
* **speed**: speed in knots x 10 (i.e. 10,1 knots is 101)
* **lon**: longitude
* **lat**: latitude
* **course**: vessel's course over ground
* **heading**: vessel's true heading
* **rot**: vessel's rate of turn
* **timestamp**: position timestamp

**The API end-point must:**
* Support the following filters: 
  * **mmsi** (single or multiple)
  * **latitude** and **longitude range**
  * as well as **time interval**.
* Log incoming requests to a datastore of  your choice (plain text, database, third party service etc.)
* Limit requests per user to **10/hour**. (Use the request remote IP as a user identifier)
* Support the following content types:
  * At least two of the following: application/json, application/vnd.api+json, application/ld+json, application/hal+json
  * application/xml
  * text/csv

**Share your work:**
* Fork this repo and create a pull request that contains your implementation in a new branch named after you.


**Notes:** 
* Please include your Tests with your source code
* Include instructions
* Feel free to use the framework, libraries of your choice or plain PHP to implement the assignment

**Have fun!**

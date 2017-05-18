# Keycloak MySQL

Extends the Keycloak docker image to use MySQL

## Usage

### Start a Network instance

First create a network:

    docker network create sso

### Start a MySQL instance

Start a MySQL instance using the MySQL docker image:

    docker container run --name mysql --network sso --network-alias mysql -e MYSQL_DATABASE=keycloak -e MYSQL_USER=keycloak -e DB_PASSWORD=password -e MYSQL_ROOT_PASSWORD=root_password -d mysql

### Start a Keycloak instance

Start a Keycloak instance and connect to the MySQL instance:

    docker container run --name keycloak --network sso --network-alias keycloak openfact/keycloak-mysql

### Environment variables

When starting the Keycloak instance you can pass a number of environment variables to configure how it connects to MySQL. For example:

    docker container run --name keycloak --network sso --network-alias keycloak -e DB_ADDR=mysql -e DB_PORT=3306 -e MYSQL_DATABASE=keycloak -e POSTGRES_USER=keycloak -e DB_PASSWORD=password openfact/keycloak-mysql

#### DB_ADDR

Specify name of MySQL address (optional, default is `mysql`).

#### DB_PORT

Specify name of MySQL port (optional, default is `3306`).

#### MYSQL_DATABASE

Specify name of MySQL database (optional, default is `keycloak`).

#### MYSQL_USER

Specify user for MySQL database (optional, default is `keycloak`).

#### DB_PASSWORD

Specify password for MySQL database (optional, default is `keycloak`).
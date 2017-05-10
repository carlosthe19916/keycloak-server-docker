# Keycloak MySQL

Extends the Keycloak docker image to use MySQL

## Usage

### Start a Network instance

First create a network:

    docker network create sso

### Start a MySQL instance

Start a MySQL instance using the MySQL docker image:

    docker container run --name mysql --network sso --network-alias mysql -e MYSQL_DATABASE=keycloak -e MYSQL_USER=keycloak -e MYSQL_PASSWORD=password -e MYSQL_ROOT_PASSWORD=root_password -d mysql

### Start a Keycloak instance

Start a Keycloak instance and connect to the MySQL instance:

    docker container run --name keycloak --network sso --network-alias keycloak openfact/keycloak-mysql

### Environment variables

When starting the Keycloak instance you can pass a number of environment variables to configure how it connects to MySQL. For example:

    docker container run --name keycloak --network sso --network-alias keycloak -e MYSQL_PORT_3306_TCP_ADDR=mysql -e MYSQL_PORT_3306_TCP_PORT=3306 -e MYSQL_DATABASE=keycloak -e MYSQL_USERNAME=keycloak -e MYSQL_PASSWORD=password openfact/keycloak-mysql

#### MYSQL_PORT_3306_TCP_ADDR

Specify name of MySQL address (optional, default is `mysql`).

#### MYSQL_PORT_3306_TCP_PORT

Specify name of MySQL port (optional, default is `3306`).

#### MYSQL_DATABASE

Specify name of MySQL database (optional, default is `keycloak`).

#### MYSQL_USER

Specify user for MySQL database (optional, default is `keycloak`).

#### MYSQL_PASSWORD

Specify password for MySQL database (optional, default is `keycloak`).
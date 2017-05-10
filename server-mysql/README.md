# Openfact MySQL

Extends the Openfact docker image to use MySQL

## Usage

### Start a Network instance

First create a network:

    docker network create ubl

### Start a Keycloak instance
To boot in standalone mode

    docker container run --name keycloak --network ubl --network-alias keycloak -d openfact/keycloak

### Start a MySQL instance

First start a MySQL instance using the MySQL docker image:

    docker container run --name mysql --network ubl --network-alias mysql -e MYSQL_DATABASE=openfact -e MYSQL_USER=openfact -e MYSQL_PASSWORD=password -e MYSQL_ROOT_PASSWORD=root_password -d mysql

### Start a Openfact instance

Start a Openfact instance and connect to the MySQL instance:

    docker container run --name openfact --network ubl --network-alias openfact openfact/openfact-mysql

### Environment variables

When starting the Openfact instance you can pass a number of environment variables to configure how it connects to MySQL. For example:

    docker container run --name openfact --network ubl --network-alias openfact -e KEYCLOAK_PORT_8080_TCP_ADDR=keycloak -e KEYCLOAK_PORT_8080_TCP_PORT=8080 -e MYSQL_PORT_3306_TCP_ADDR=postgres -e MYSQL_PORT_3306_TCP_PORT=3306 -e MYSQL_DATABASE=openfact -e MYSQL_USER=openfact -e MYSQL_PASSWORD=password openfact/openfact-mysql

#### KEYCLOAK_PORT_8080_TCP_ADDR

Specify name of PostgreSQL database (optional, default is `keycloak`).

#### KEYCLOAK_PORT_8080_TCP_PORT

Specify name of PostgreSQL database (optional, default is `8080`).

#### MYSQL_PORT_3306_TCP_ADDR

Specify name of PostgreSQL database (optional, default is `mysql`).

#### MYSQL_PORT_3306_TCP_PORT

Specify name of PostgreSQL database (optional, default is `3306`).

#### MYSQL_DATABASE

Specify name of MySQL database (optional, default is `openfact`).

#### MYSQL_USER

Specify user for MySQL database (optional, default is `openfact`).

#### MYSQL_PASSWORD

Specify password for MySQL database (optional, default is `openfact`).
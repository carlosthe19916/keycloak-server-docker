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

    docker container run --name mysql --network ubl --network-alias mysql -e MYSQL_DATABASE=openfact -e MYSQL_USER=openfact -e DB_PASSWORD=password -e MYSQL_ROOT_PASSWORD=root_password -d mysql

### Start a Openfact instance

Start a Openfact instance and connect to the MySQL instance:

    docker container run --name openfact --network ubl --network-alias openfact openfact/openfact-mysql

### Environment variables

When starting the Openfact instance you can pass a number of environment variables to configure how it connects to MySQL. For example:

    docker container run --name openfact --network ubl --network-alias openfact -e KEYCLOAK_AUTH_SERVER_URL=http://mydomain/auth -e DB_ADDR=postgres -e DB_PORT=3306 -e MYSQL_DATABASE=openfact -e MYSQL_USER=openfact -e DB_PASSWORD=password openfact/openfact-mysql

#### KEYCLOAK_AUTH_SERVER_URL

Specify name auth server url (optional, default is `keycloak`).

#### DB_ADDR

Specify name of PostgreSQL database (optional, default is `mysql`).

#### DB_PORT

Specify name of PostgreSQL database (optional, default is `3306`).

#### MYSQL_DATABASE

Specify name of MySQL database (optional, default is `openfact`).

#### MYSQL_USER

Specify user for MySQL database (optional, default is `openfact`).

#### DB_PASSWORD

Specify password for MySQL database (optional, default is `openfact`).
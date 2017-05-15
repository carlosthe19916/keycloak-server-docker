# Keycloak PostgreSQL

Extends the Keycloak docker image to use PostgreSQL

## Usage

### Start a Network instance

First create a network:

    docker network create sso

### Start a PostgreSQL instance

First start a PostgreSQL instance using the PostgreSQL docker image:

    docker container run --name postgres --network sso --network-alias postgres -e DB_DATABASE=keycloak -e DB_USERNAME=keycloak -e DB_PASSWORD=password -e POSTGRES_ROOT_PASSWORD=root_password -d postgres

### Start a Keycloak instance

Start a Keycloak instance and connect to the PostgreSQL instance:

    docker container run --name keycloak --network sso --network-alias keycloak openfact/keycloak-postgres

### Environment variables

When starting the Keycloak instance you can pass a number of environment variables to configure how it connects to PostgreSQL. For example:

    docker container run --name keycloak --network sso --network-alias keycloak -e POSTGRES_PORT_5432_TCP_ADDR=postgres -e POSTGRES_PORT_5432_TCP_PORT=5432 -e DB_DATABASE=keycloak -e DB_USERNAME=keycloak -e DB_PASSWORD=password openfact/keycloak-postgres

#### DB_DATABASE

Specify name of PostgreSQL database (optional, default is `keycloak`).

#### DB_USERNAME

Specify user for PostgreSQL database (optional, default is `keycloak`).

#### DB_PASSWORD

Specify password for PostgreSQL database (optional, default is `keycloak`).

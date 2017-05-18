# Keycloak PostgreSQL

Extends the Keycloak docker image to use PostgreSQL

## Usage

### Start a Network instance

First create a network:

    docker network create sso

### Start a PostgreSQL instance

First start a PostgreSQL instance using the PostgreSQL docker image:

    docker container run --name postgres --network sso --network-alias postgres -e POSTGRES_DATABASE=keycloak -e POSTGRES_USER=keycloak -e POSTGRES_PASSWORD=password -e POSTGRES_ROOT_PASSWORD=root_password -d postgres

### Start a Keycloak instance

Start a Keycloak instance and connect to the PostgreSQL instance:

    docker container run --name keycloak --network sso --network-alias keycloak openfact/keycloak-postgres

### Environment variables

When starting the Keycloak instance you can pass a number of environment variables to configure how it connects to PostgreSQL. For example:

    docker container run --name keycloak --network sso --network-alias keycloak -e DB_ADDR=postgres -e DB_PORT=5432 -e POSTGRES_DATABASE=keycloak -e POSTGRES_USER=keycloak -e DB_PASSWORD=password openfact/keycloak-postgres

#### POSTGRES_DATABASE

Specify name of PostgreSQL database (optional, default is `keycloak`).

#### POSTGRES_USER

Specify user for PostgreSQL database (optional, default is `keycloak`).

#### POSTGRES_PASSWORD

Specify password for PostgreSQL database (optional, default is `password`).

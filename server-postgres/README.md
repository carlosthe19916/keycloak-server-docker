# Openfact PostgreSQL

Extends the Openfact docker image to use PostgreSQL

## Usage

### Start a Network instance

First create a network:

    docker network create ubl

### Start a Keycloak instance
To boot in standalone mode

    docker container run --name keycloak --network ubl --network-alias keycloak -d openfact/keycloak

### Start a PostgreSQL instance

First start a PostgreSQL instance using the PostgreSQL docker image:

    docker container run --name postgres --network ubl --network-alias postgres -e POSTGRES_DATABASE=openfact -e POSTGRES_USER=openfact -e POSTGRES_PASSWORD=password -e POSTGRES_ROOT_PASSWORD=root_password -d postgres

### Start a Openfact instance

Start a Openfact instance and connect to the PostgreSQL instance:

    docker container run --name openfact --network ubl --network-alias openfact openfact/openfact-postgres

### Environment variables

When starting the Openfact instance you can pass a number of environment variables to configure how it connects to PostgreSQL. For example:

    docker container run --name openfact --network ubl --network-alias openfact -e KEYCLOAK_PORT_8080_TCP_ADDR=keycloak -e KEYCLOAK_PORT_8080_TCP_PORT=8080 -e POSTGRES_PORT_5432_TCP_ADDR=postgres -e POSTGRES_PORT_5432_TCP_PORT=5432 -e POSTGRES_DATABASE=openfact -e POSTGRES_USER=openfact -e POSTGRES_PASSWORD=password openfact/openfact-postgres

#### KEYCLOAK_PORT_8080_TCP_ADDR

Specify name of PostgreSQL database (optional, default is `keycloak`).

#### KEYCLOAK_PORT_8080_TCP_PORT

Specify name of PostgreSQL database (optional, default is `8080`).

#### POSTGRES_PORT_5432_TCP_ADDR

Specify name of PostgreSQL database (optional, default is `postgres`).

#### POSTGRES_PORT_5432_TCP_PORT

Specify name of PostgreSQL database (optional, default is `5432`).

#### POSTGRES_DATABASE

Specify name of PostgreSQL database (optional, default is `openfact`).

#### POSTGRES_USER

Specify user for PostgreSQL database (optional, default is `openfact`).

#### POSTGRES_PASSWORD

Specify password for PostgreSQL database (optional, default is `openfact`).
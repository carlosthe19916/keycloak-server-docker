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

    docker container run --name postgres --network ubl --network-alias postgres -e POSTGRES_DATABASE=openfact -e POSTGRES_USER=openfact -e DB_PASSWORD=password -e POSTGRES_ROOT_PASSWORD=root_password -d postgres

### Start a Openfact instance

Start a Openfact instance and connect to the PostgreSQL instance:

    docker container run --name openfact --network ubl --network-alias openfact openfact/openfact-postgres

### Environment variables

When starting the Openfact instance you can pass a number of environment variables to configure how it connects to PostgreSQL. For example:

    docker container run --name openfact --network ubl --network-alias openfact -e KEYCLOAK_AUTH_SERVER_URL=http://mydomain/auth -e DB_ADDR=postgres -e DB_PORT=5432 -e POSTGRES_DATABASE=openfact -e POSTGRES_USER=openfact -e DB_PASSWORD=password openfact/openfact-postgres

#### KEYCLOAK_AUTH_SERVER_URL

Specify name of Keycloak server url (optional, default is `keycloak`).

#### DB_ADDR

Specify name of PostgreSQL database (optional, default is `postgres`).

#### DB_PORT

Specify name of PostgreSQL database (optional, default is `5432`).

#### POSTGRES_DATABASE

Specify name of PostgreSQL database (optional, default is `openfact`).

#### POSTGRES_USER

Specify user for PostgreSQL database (optional, default is `openfact`).

#### DB_PASSWORD

Specify password for PostgreSQL database (optional, default is `openfact`).
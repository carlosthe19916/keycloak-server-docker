# Keycloak HA PostgreSQL

Example Docker file for clustered Keycloak using a PostgreSQL

## Usage

### Start a Network instance

First create a network:

    docker network create sso

### Start a PostgreSQL instance

First start a PostgreSQL instance using the PostgreSQL docker image:

    docker container run --name postgres --name postgres --network sso --network-alias postgres -e POSTGRES_DATABASE=keycloak -e POSTGRES_USER=keycloak -e DB_PASSWORD=password -e POSTGRES_ROOT_PASSWORD=root_password -d postgres

### Start a Keycloak HA instance

Start two or more Keycloak instances that form a cluster and connect to the PostgreSQL instance running in previously started 'postgres' container:

    docker container run --name keycloak1 --network sso -e DB_ADDR=postgres -e DB_PORT=5432 -e POSTGRES_DATABASE=keycloak -e POSTGRES_USER=keycloak -e DB_PASSWORD=password -d openfact/keycloak-ha-postgres
    docker logs -f keycloak1

    docker container run --name keycloak2 --network sso -e DB_ADDR=postgres -e DB_PORT=5432 -e POSTGRES_DATABASE=keycloak -e POSTGRES_USER=keycloak -e DB_PASSWORD=password -d openfact/keycloak-ha-postgres
    docker logs -f keycloak2


## Other details

This image extends the [`jboss/keycloak-postgres`](https://github.com/openfact/openfact-dockerfiles) image. Please refer to the README.md for selected images for more info.

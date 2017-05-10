# Openfact HA PostgreSQL

Example Docker file for clustered Openfact using a PostgreSQL

## Usage

### Start a Network instance

First create a network:

    docker network create ubl

### Start a Keycloak instance

Create a Keycloak instance:

    docker container run --name keycloak --network ubl --network-alias keycloak  -d openfact/keycloak

### Start a PostgreSQL instance

Start a PostgreSQL instance using the PostgreSQL docker image:

    docker container run --name postgres --network ubl --network-alias postgres -e POSTGRES_DATABASE=openfact -e POSTGRES_USER=openfact -e POSTGRES_PASSWORD=password -e POSTGRES_ROOT_PASSWORD=root_password -d postgres

### Start a Openfact HA instance

Start two or more Openfact instances that form a cluster and connect to the PostgreSQL instance running in previously started 'postgres' container:

    docker container run --name openfact1 --network ubl -e KEYCLOAK_PORT_8080_TCP_ADDR=keycloak -e KEYCLOAK_PORT_8080_TCP_PORT=8080 -e POSTGRES_PORT_5432_TCP_ADDR=postgres -e POSTGRES_PORT_5432_TCP_PORT=5432 -e POSTGRES_DATABASE=openfact -e POSTGRES_USER=openfact -e POSTGRES_PASSWORD=password -d openfact/openfact-ha-postgres

    docker logs -f openfact1

    docker container run --name openfact2 --network ubl -e KEYCLOAK_PORT_8080_TCP_ADDR=keycloak -e KEYCLOAK_PORT_8080_TCP_PORT=8080 -e POSTGRES_PORT_5432_TCP_ADDR=postgres -e POSTGRES_PORT_5432_TCP_PORT=5432 -e POSTGRES_DATABASE=openfact -e POSTGRES_USER=openfact -e POSTGRES_PASSWORD=password -d openfact/openfact-ha-postgres
    
    docker logs -f openfact2


## Other details

This image extends the [`openfact/openfact-postgres`](https://github.com/openfact/openfact-dockerfiles) image. Please refer to the README.md for selected images for more info.
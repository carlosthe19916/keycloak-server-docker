# Openfact HA PostgreSQL

Example Docker file for clustered Openfact using a PostgreSQL

## Usage

### Start a PostgreSQL instance

First start a PostgreSQL instance using the PostgreSQL docker image:

    docker run --name postgres -e POSTGRES_DATABASE=openfact -e POSTGRES_USER=openfact -e POSTGRES_PASSWORD=password -e POSTGRES_ROOT_PASSWORD=password -d postgres

### Start a Openfact HA instance

Start two or more Openfact instances that form a cluster and connect to the PostgreSQL instance running in previously started 'postgres' container:

    docker run --name openfact --link postgres:postgres -e POSTGRES_DATABASE=openfact -e POSTGRES_USER=openfact -e POSTGRES_PASSWORD=password jboss/openfact-ha-postgres
    docker logs -f openfact

    docker run --name openfact2 --link postgres:postgres -e POSTGRES_DATABASE=openfact -e POSTGRES_USER=openfact -e POSTGRES_PASSWORD=password jboss/openfact-ha-postgres
    docker logs -f openfact2


## Other details

This image extends the [`openfact/openfact-postgres`](https://github.com/openfact/openfact-dockerfiles) image. Please refer to the README.md for selected images for more info.
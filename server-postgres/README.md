# Openfact PostgreSQL

Extends the Openfact docker image to use PostgreSQL

## Usage

### Start a PostgreSQL instance

First start a PostgreSQL instance using the PostgreSQL docker image:

    docker run --name postgres -e POSTGRES_DATABASE=openfact -e POSTGRES_USER=openfact -e POSTGRES_PASSWORD=password -e POSTGRES_ROOT_PASSWORD=root_password -d postgres

### Start a Openfact instance

Start a Openfact instance and connect to the PostgreSQL instance:

    docker run --name openfact --link postgres:postgres openfact/openfact-postgres

### Environment variables

When starting the Openfact instance you can pass a number of environment variables to configure how it connects to PostgreSQL. For example:

    docker run --name openfact --link postgres:postgres -e POSTGRES_DATABASE=openfact -e POSTGRES_USER=openfact -e POSTGRES_PASSWORD=password openfact/openfact-postgres

#### POSTGRES_DATABASE

Specify name of PostgreSQL database (optional, default is `openfact`).

#### POSTGRES_USER

Specify user for PostgreSQL database (optional, default is `openfact`).

#### POSTGRES_PASSWORD

Specify password for PostgreSQL database (optional, default is `openfact`).
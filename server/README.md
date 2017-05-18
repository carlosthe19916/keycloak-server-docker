# Openfact Docker image

Example Dockerfile with Openfact server.

## Usage

### Start a Network instance

First create a network:

    docker network create ubl

### Start a Keycloak instance
To boot in standalone mode

    docker container run --name keycloak --network ubl --network-alias keycloak -d openfact/keycloak

### Start a Openfact instance
To boot in standalone mode

    docker container run --name openfact --network ubl --network-alias openfact openfact/openfact

# Running with full custom variables

    docker container run --name openfact --network ubl --network-alias openfact -e KEYCLOAK_AUTH_SERVER_URL=http://mydomain/auth openfact/openfact

## Other details

This image extends the [`jboss/base-jdk`](https://github.com/JBoss-Dockerfiles/base-jdk) image which adds the OpenJDK distribution on top of the [`jboss/base`](https://github.com/JBoss-Dockerfiles/base) image. Please refer to the README.md for selected images for more info.
# Openfact Docker image

Example Dockerfile with Openfact server.

## Usage

To boot in standalone mode

    docker run openfact/openfact
    
# Running with custom keycloak auth server

    docker run -e KEYCLOAK_AUTH_SERVER_URL=<https://keycloak/auth> openfact/openfact

# Running with full custom variables

    docker run -e KEYCLOAK_REALM=<openfact> -e KEYCLOAK_BEARER_ONLY=<true> -e KEYCLOAK_AUTH_SERVER_URL=<https://openfact.org/auth> -e KEYCLOAK_SSL_REQUIRED=<external> -e KEYCLOAK_RESOURCE=<openfact> -e KEYCLOAK_USE_RESOURCE_ROLE_MAPPINGS=<true> -e KEYCLOAK_ENABLE_CORS=<true>

## Other details

This image extends the [`jboss/base-jdk`](https://github.com/JBoss-Dockerfiles/base-jdk) image which adds the OpenJDK distribution on top of the [`jboss/base`](https://github.com/JBoss-Dockerfiles/base) image. Please refer to the README.md for selected images for more info.
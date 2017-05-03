FROM jboss/keycloak-adapter-wildfly

ENV OPENFACT_VERSION 1.0.RC14

ENV OPENFACT_KC_REALM openfact
ENV OPENFACT_KC_BEARER_ONLY true
ENV OPENFACT_KC_AUTH_SERVER_URL https
ENV OPENFACT_KC_SSL_REQUIRED external
ENV OPENFACT_KC_RESOURCE openfact
ENV OPENFACT_KC_USE_RESOURCE_ROLE_MAPPINGS true
ENV OPENFACT_KC_ENABLE_CORS true

WORKDIR /opt/jboss/wildfly/standalone/deployments

RUN curl -L https://github.com/openfact/openfact/releases/download/$OPENFACT_VERSION/openfact.war

WORKDIR /opt/jboss

# Standalone.xml modifications.
RUN sed -i '/<subsystem xmlns="urn:jboss:domain:keycloak:1.1"\/>/ d' $JBOSS_HOME/standalone/configuration/standalone.xml && \
    sed -i -e 's/<profile>/&\n        <subsystem xmlns="urn:jboss:domain:keycloak:1.1">\n            <secure-deployment name="openfact.war">\n                <realm>'"$OPENFACT_KC_REALM"'<\/realm>\n                <bearer-only>true<\/bearer-only>\n                <auth-server-url>https<\/auth-server-url>\n                <ssl-required>external<\/ssl-required>\n                <resource>openfact<\/resource>\n                <use-resource-role-mappings>true<\/use-resource-role-mappings>\n            <enable-cors>true<\/enable-cors>\n                <\/secure-deployment>\n        <\/subsystem>/' $JBOSS_HOME/standalone/configuration/standalone.xml

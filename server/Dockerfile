FROM jboss/keycloak-adapter-wildfly

ENV OPENFACT_VERSION 1.0.0.Final

WORKDIR /opt/jboss/wildfly/standalone/deployments

RUN curl -L https://github.com/openfact/openfact/releases/download/1.0.RC14/openfact.war

WORKDIR /opt/jboss

# Standalone.xml modifications.
RUN sed -i -e 's/<profile>/&\n  <subsystem xmlns="urn:jboss:domain:keycloak:1.1">\n  <secure-deployment name="openfact.war">\n <realm>openfact<\/realm>\n  <resource>openfact<\/resource>\n  <use-resource-role-mappings>true<\/use-resource-role-mappings>\n  <bearer-only>true<\/bearer-only>\n  <auth-server-url>https://kcopenfact-softgreen.rhcloud.com/auth<\/auth-server-url>\n  <ssl-required>external<\/ssl-required>\n  <enable-cors>true<\/enable-cors>\n  <\/secure-deployment>\n  <\/subsystem>/' $JBOSS_HOME/standalone/configuration/standalone.xml

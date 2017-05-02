FROM jboss/keycloak-adapter-wildfly

ENV OPENFACT_VERSION 1.0.0.Final

WORKDIR /opt/jboss/wildfly

RUN curl -L https://github.com/openfact/openfact/releases/download/1.0.RC14/openfact.war

WORKDIR /opt/jboss

# Standalone.xml modifications.
#RUN sed -i -e 's/<extensions>/&\n        <extension module="org.keycloak.keycloak-adapter-subsystem"\/>/' $JBOSS_HOME/standalone/configuration/standalone.xml && \
#    sed -i -e 's/<profile>/&\n        <subsystem xmlns="urn:jboss:domain:keycloak:1.1"\/>/' $JBOSS_HOME/standalone/configuration/standalone.xml && \
#    sed -i -e 's/<security-domains>/&\n                <security-domain name="keycloak">\n                    <authentication>\n                        <login-module code="org.keycloak.adapters.jboss.KeycloakLoginModule" flag="required"\/>\n                    <\/authentication>\n                <\/security-domain>/' $JBOSS_HOME/standalone/configuration/standalone.xml
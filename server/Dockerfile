FROM jboss/keycloak-adapter-wildfly

ENV OPENFACT_VERSION 1.0.RC14

ENV OPENFACT_KC_REALM openfact
ENV OPENFACT_KC_BEARER_ONLY true
ENV OPENFACT_KC_AUTH_SERVER_URL auth
ENV OPENFACT_KC_SSL_REQUIRED external
ENV OPENFACT_KC_RESOURCE openfact
ENV OPENFACT_KC_USE_RESOURCE_ROLE_MAPPINGS true
ENV OPENFACT_KC_ENABLE_CORS true

# Enables signals getting passed from startup script to JVM
# ensuring clean shutdown when container is stopped.
ENV LAUNCH_JBOSS_IN_BACKGROUND 1
ENV PROXY_ADDRESS_FORWARDING false

# Add OpenfactDS datasource
ADD datasource.sh /opt/jboss/wildfly/datasource.sh
RUN /opt/jboss/wildfly/datasource.sh
RUN rm /opt/jboss/wildfly/datasource.sh

# Standalone.xml modifications.
WORKDIR /opt/jboss

#Enabling Proxy address forwarding so we can correctly handle SSL termination in front ends
#such as an OpenShift Router or Apache Proxy
RUN sed -i -e 's/<http-listener /& proxy-address-forwarding="${env.PROXY_ADDRESS_FORWARDING}" /' $JBOSS_HOME/standalone/configuration/standalone.xml

# Adding keycloak subsystem configuration
RUN sed -i '/<subsystem xmlns="urn:jboss:domain:keycloak:1.1"\/>/ d' $JBOSS_HOME/standalone/configuration/standalone.xml && \
    sed -i -e 's/<profile>/&\n        <subsystem xmlns="urn:jboss:domain:keycloak:1.1">\n            <secure-deployment name="openfact.war">\n                <realm>'"$OPENFACT_KC_REALM"'<\/realm>\n                <bearer-only>'"$OPENFACT_KC_BEARER_ONLY"'<\/bearer-only>\n                <auth-server-url>'"$OPENFACT_KC_AUTH_SERVER_URL"'<\/auth-server-url>\n                <ssl-required>'"$OPENFACT_KC_SSL_REQUIRED"'<\/ssl-required>\n                <resource>'"$OPENFACT_KC_RESOURCE"'<\/resource>\n                <use-resource-role-mappings>'"$OPENFACT_KC_USE_RESOURCE_ROLE_MAPPINGS"'<\/use-resource-role-mappings>\n                <enable-cors>'"$OPENFACT_KC_ENABLE_CORS"'<\/enable-cors>\n            <\/secure-deployment>\n        <\/subsystem>/' $JBOSS_HOME/standalone/configuration/standalone.xml

# Download war
RUN cd $HOME && curl -L -O https://github.com/openfact/openfact/releases/download/$OPENFACT_VERSION/openfact.war && mv $HOME/openfact.war $HOME/wildfly/standalone/deployments

ADD changeSubsystem.xsl /opt/jboss/wildfly/

ADD docker-entrypoint.sh /opt/jboss/

EXPOSE 8080
ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0"]

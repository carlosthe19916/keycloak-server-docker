FROM jboss/keycloak-adapter-wildfly

ENV OPENFACT_VERSION 1.0.RC14

# Enables signals getting passed from startup script to JVM
# ensuring clean shutdown when container is stopped.
ENV LAUNCH_JBOSS_IN_BACKGROUND 1
ENV PROXY_ADDRESS_FORWARDING false
USER root

RUN yum install -y epel-release && yum install -y jq && yum clean all

USER jboss

# Add OpenfactDS datasource
ADD datasource.sh /opt/jboss/wildfly/datasource.sh
RUN /opt/jboss/wildfly/datasource.sh
RUN rm /opt/jboss/wildfly/datasource.sh

# Standalone.xml modifications.
WORKDIR /opt/jboss

# Download war
RUN cd $HOME && curl -L -O https://github.com/openfact/openfact/releases/download/$OPENFACT_VERSION/openfact.war && mv $HOME/openfact.war $HOME/wildfly/standalone/deployments

#Enabling Proxy address forwarding so we can correctly handle SSL termination in front ends
#such as an OpenShift Router or Apache Proxy
RUN sed -i -e 's/<http-listener /& proxy-address-forwarding="${env.PROXY_ADDRESS_FORWARDING}" /' $JBOSS_HOME/standalone/configuration/standalone.xml

# Adding keycloak subsystem configuration
RUN sed -i '/<subsystem xmlns="urn:jboss:domain:keycloak:1.1"\/>/ d' $JBOSS_HOME/standalone/configuration/standalone.xml && \
    sed -i -e 's/<profile>/&\n        <subsystem xmlns="urn:jboss:domain:keycloak:1.1">\n        <\/subsystem>/' $JBOSS_HOME/standalone/configuration/standalone.xml

ADD changeSubsystem.xsl /opt/jboss/wildfly/

ADD docker-entrypoint.sh /opt/jboss/

EXPOSE 8080 9990
ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0"]

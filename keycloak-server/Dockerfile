FROM jboss/keycloak:3.1.0.Final

COPY openfact-keycloak-themes.jar /opt/jboss/keycloak/
RUN $JBOSS_HOME/bin/jboss-cli.sh --command="module add --name=org.keycloak.openfact.themes --resources=openfact-keycloak-themes.jar"

# Standalone.xml modifications.
RUN sed -i -e 's/<theme>/&\n                <modules>\n                    <module>org.keycloak.openfact.themes<\/module>\n                <\/modules>/' $JBOSS_HOME/standalone/configuration/standalone.xml && \
    sed -i -e 's/<theme>/&\n                <modules>\n                    <module>org.keycloak.openfact.themes<\/module>\n                <\/modules>/' $JBOSS_HOME/standalone/configuration/standalone-ha.xml && \
    sed -i -e 's/<theme>/&\n                    <modules>\n                    <module>org.keycloak.openfact.themes<\/module>\n                <\/modules>/' $JBOSS_HOME/domain/configuration/domain.xml && \

    sed -i -e 's/<theme>/&\n                <welcomeTheme>openfact<\/welcomeTheme>/' $JBOSS_HOME/standalone/configuration/standalone.xml && \
    sed -i -e 's/<theme>/&\n                <welcomeTheme>openfact<\/welcomeTheme>/' $JBOSS_HOME/standalone/configuration/standalone-ha.xml && \
    sed -i -e 's/<theme>/&\n                    <welcomeTheme>openfact<\/welcomeTheme>/' $JBOSS_HOME/domain/configuration/domain.xml && \

#Give correct permissions when used in an OpenShift environment.
USER root
RUN chown -R jboss:0 $JBOSS_HOME/standalone && \
    chmod -R g+rw $JBOSS_HOME/standalone
USER jboss
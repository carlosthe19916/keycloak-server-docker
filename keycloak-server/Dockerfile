FROM jboss/keycloak:2.5.5.Final

ADD openfact-realm.json /opt/jboss/keycloak/

#Give correct permissions when used in an OpenShift environment.
USER root
RUN chown -R jboss:0 $JBOSS_HOME/standalone && \
    chmod -R g+rw $JBOSS_HOME/standalone
USER jboss

ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0", "-Dkeycloak.import=/opt/jboss/keycloak/openfact-realm.json"]

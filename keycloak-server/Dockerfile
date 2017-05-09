FROM jboss/keycloak:2.5.5.Final

ADD openfact-realm.json /opt/jboss/keycloak/

ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0", "-Dkeycloak.import=/opt/jboss/keycloak/openfact-realm.json"]

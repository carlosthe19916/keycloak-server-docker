FROM openfact/openfact:latest

ADD changeDatabase.xsl /opt/jboss/wildfly/
RUN java -jar /usr/share/java/saxon.jar -s:/opt/jboss/wildfly/standalone/configuration/standalone.xml -xsl:/opt/jboss/wildfly/changeDatabase.xsl -o:/opt/jboss/wildfly/standalone/configuration/standalone.xml; java -jar /usr/share/java/saxon.jar -s:/opt/jboss/wildfly/standalone/configuration/standalone-ha.xml -xsl:/opt/jboss/wildfly/changeDatabase.xsl -o:/opt/jboss/wildfly/standalone/configuration/standalone-ha.xml; rm /opt/jboss/wildfly/changeDatabase.xsl
RUN mkdir -p /opt/jboss/wildfly/modules/system/layers/base/org/postgresql/jdbc/main; cd /opt/jboss/wildfly/modules/system/layers/base/org/postgresql/jdbc/main; curl -O http://central.maven.org/maven2/org/postgresql/postgresql/9.3-1102-jdbc3/postgresql-9.3-1102-jdbc3.jar
ADD module.xml /opt/jboss/wildfly/modules/system/layers/base/org/postgresql/jdbc/main/

COPY  docker-entrypoint-waitforit.sh wait-for-it.sh /opt/jboss/
ENTRYPOINT ["/opt/jboss/docker-entrypoint-waitforit.sh"]

CMD ["-b", "0.0.0.0"]
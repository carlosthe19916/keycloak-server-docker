FROM openfact/openfact:latest

ADD changeDatabase.xsl /opt/jboss/wildfly/
RUN java -jar /usr/share/java/saxon.jar -s:/opt/jboss/wildfly/standalone/configuration/standalone.xml -xsl:/opt/jboss/wildfly/changeDatabase.xsl -o:/opt/jboss/wildfly/standalone/configuration/standalone.xml; java -jar /usr/share/java/saxon.jar -s:/opt/jboss/wildfly/standalone/configuration/standalone-ha.xml -xsl:/opt/jboss/wildfly/changeDatabase.xsl -o:/opt/jboss/wildfly/standalone/configuration/standalone-ha.xml; rm /opt/jboss/wildfly/changeDatabase.xsl
RUN mkdir -p /opt/jboss/wildfly/modules/system/layers/base/com/mysql/jdbc/main; cd /opt/jboss/wildfly/modules/system/layers/base/com/mysql/jdbc/main && curl -O http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.18/mysql-connector-java-5.1.18.jar
ADD module.xml /opt/jboss/wildfly/modules/system/layers/base/com/mysql/jdbc/main/
RUN head -2000 /opt/jboss/wildfly/standalone/configuration/standalone.xml

COPY  docker-entrypoint-waitforit.sh wait-for-it.sh /opt/jboss
ENTRYPOINT ["/opt/jboss/docker-entrypoint-waitforit.sh"]

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
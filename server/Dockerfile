FROM jboss/keycloak-adapter-wildfly:2.5.5.Final

ENV OPENFACT_VERSION 1.0.RC14

RUN cd $HOME && curl -L -O https://github.com/openfact/openfact/releases/download/$OPENFACT_VERSION/openfact.war && mv $HOME/openfact.war $HOME/wildfly/standalone/deployments

ADD changeDatabase.xsl /opt/jboss/wildfly
RUN java -jar /usr/share/java/saxon.jar -s:/opt/jboss/wildfly/standalone/configuration/standalone.xml -xsl:/opt/jboss/wildfly/changeDatabase.xsl -o:/opt/jboss/wildfly/standalone/configuration/standalone.xml; java -jar /usr/share/java/saxon.jar -s:/opt/jboss/wildfly/standalone/configuration/standalone-ha.xml -xsl:/opt/jboss/wildfly/changeDatabase.xsl -o:/opt/jboss/wildfly/standalone/configuration/standalone-ha.xml; rm /opt/jboss/wildfly/changeDatabase.xsl

ADD changeKeycloak.xsl /opt/jboss/wildfly
RUN java -jar /usr/share/java/saxon.jar -s:/opt/jboss/wildfly/standalone/configuration/standalone.xml -xsl:/opt/jboss/wildfly/changeKeycloak.xsl -o:/opt/jboss/wildfly/standalone/configuration/standalone.xml; java -jar /usr/share/java/saxon.jar -s:/opt/jboss/wildfly/standalone/configuration/standalone-ha.xml -xsl:/opt/jboss/wildfly/changeKeycloak.xsl -o:/opt/jboss/wildfly/standalone/configuration/standalone-ha.xml; rm /opt/jboss/wildfly/changeKeycloak.xsl
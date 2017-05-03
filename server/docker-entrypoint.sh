#!/bin/bash

java -jar /usr/share/java/saxon.jar -s:/opt/jboss/wildfly/standalone/configuration/standalone.xml -xsl:/opt/jboss/wildfly/changeSubsystem.xsl -o:/opt/jboss/wildfly/standalone/configuration/standalone.xml; rm /opt/jboss/wildfly/changeSubsystem.xsl; java -jar /usr/share/java/saxon.jar -s:/opt/jboss/wildfly/standalone/configuration/standalone-ha.xml -xsl:/opt/jboss/wildfly/changeSubsystem.xsl -o:/opt/jboss/wildfly/standalone/configuration/standalone-ha.xml; rm /opt/jboss/wildfly/changeSubsystem.xsl

exec /opt/jboss/wildfly/bin/standalone.sh $@
exit $?
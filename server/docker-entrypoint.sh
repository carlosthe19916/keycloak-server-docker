#!/bin/bash

if [ $OPENFACT_KC_REALM ]; then
    java -jar /usr/share/java/saxon.jar -s:/opt/jboss/wildfly/standalone/configuration/standalone.xml -xsl:/opt/jboss/wildfly/changeSubsystem.xsl -o:/opt/jboss/wildfly/standalone/configuration/standalone.xml; rm /opt/jboss/wildfly/changeSubsystem.xsl
fi

exec /opt/jboss/wildfly/bin/standalone.sh $@
exit $?
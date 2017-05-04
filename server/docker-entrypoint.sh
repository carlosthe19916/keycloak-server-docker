#!/bin/bash

if [ $OPENFACT_KC_REALM ] || [ $OPENFACT_KC_BEARER_ONLY ] || [ $OPENFACT_KC_AUTH_SERVER_URL ] || [ $OPENFACT_KC_SSL_REQUIRED ] || [ $OPENFACT_KC_RESOURCE ] || [ $OPENFACT_KC_USE_RESOURCE_ROLE_MAPPINGS ] || [ $OPENFACT_KC_ENABLE_CORS ]; then
    java -jar /usr/share/java/saxon.jar -s:/opt/jboss/wildfly/standalone/configuration/standalone.xml -xsl:/opt/jboss/changeSubsystem.xsl -o:/opt/jboss/wildfly/standalone/configuration/standalone.xml; java -jar /usr/share/java/saxon.jar -s:/opt/jboss/wildfly/standalone/configuration/standalone-ha.xml -xsl:/opt/jboss/changeSubsystem.xsl -o:/opt/jboss/wildfly/standalone/configuration/standalone-ha.xml
fi

head -2000 /opt/jboss/wildfly/standalone/configuration/standalone.xml

exec /opt/jboss/wildfly/bin/standalone.sh $@
exit $?
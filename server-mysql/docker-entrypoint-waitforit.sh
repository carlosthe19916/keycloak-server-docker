#!/bin/bash

/opt/jboss/wait-for-it.sh ${DB_ADDR:-mysql}:${DB_PORT:-3306} -t 60 -- /opt/jboss/wildfly/bin/standalone.sh $@
exit $?
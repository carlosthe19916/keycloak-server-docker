#!/bin/bash

/opt/jboss/wait-for-it.sh ${DB_ADDR:-postgres}:${DB_PORT:-5432} -t 60 -- /opt/jboss/wildfly/bin/standalone.sh $@
exit $?
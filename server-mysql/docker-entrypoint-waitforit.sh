#!/bin/bash

/opt/jboss/wait-for-it.sh ${MYSQL_PORT_3306_TCP_ADDR:-mysql}:${MYSQL_PORT_3306_TCP_PORT:-3306} -t 60 

exec /opt/jboss/wildfly/bin/standalone.sh $@
exit $?
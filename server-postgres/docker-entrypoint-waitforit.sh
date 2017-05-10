#!/bin/bash
./opt/jboss/wait-for-it.sh ${POSTGRES_PORT_5432_TCP_ADDR:-postgres}:${POSTGRES_PORT_5432_TCP_PORT:5432} -t 60 $@
exit $?
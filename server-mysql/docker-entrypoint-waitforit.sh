#!/bin/bash
/wait-for-it.sh ${MYSQL_PORT_3306_TCP_ADDR:-mysql}:${MYSQL_PORT_3306_TCP_PORT:-3306} -t 60 $@
exit $?
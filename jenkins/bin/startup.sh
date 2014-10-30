#!/usr/bin/env bash

. /usr/share/jenkins/bin/setenv.sh

. $CATALINA_HOME/bin/catalina.sh start

echo "Waiting for `cat $CATALINA_PID`"
wait `cat $CATALINA_PID`

#!/usr/bin/env bash

. /home/sonar/bin/setenv.sh

/usr/share/sonarqube/bin/linux-x86-64/sonar.sh console

echo "Waiting for `cat $SONARQUBE_PID`"
wait `cat $SONARQUBE_PID`

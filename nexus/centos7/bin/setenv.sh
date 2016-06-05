#!/usr/bin/env bash

export JAVA_HOME=/usr/java/jdk1.8.0

export CATALINA_BASE=/usr/share/nexus
export CATALINA_HOME=/usr/share/tomcat7
export CATALINA_OPTS="-server -Xmx1024m -XX:MaxMetaspaceSize=256m -XX:+HeapDumpOnOutOfMemoryError -Djava.awt.headless=true"
export CATALINA_PID="$CATALINA_BASE/tomcat.pid"

export PATH=$PATH:$JAVA_HOME/bin;
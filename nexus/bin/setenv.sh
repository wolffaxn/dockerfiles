#!/usr/bin/env bash

export JAVA_HOME=/usr/java/java7

export CATALINA_BASE=/home/nexus
export CATALINA_HOME=/usr/share/tomcat7
export CATALINA_OPTS="-server -Xmx1024m -XX:MaxPermSize=256m -XX:+HeapDumpOnOutOfMemoryError -Djava.awt.headless=true"
export CATALINA_PID=/var/run/nexus/nexus.pid

export PATH=$PATH:$JAVA_HOME/bin;

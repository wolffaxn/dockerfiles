#!/usr/bin/env bash

docker build --rm -t wolffaxn/base base
docker build --rm -t wolffaxn/oracle-java8 oracle-java8
docker build --rm -t wolffaxn/tomcat7 tomcat7
docker build --rm -t wolffaxn/tomcat8 tomcat8
docker build --rm -t wolffaxn/jenkins jenkins
docker build --rm -t wolffaxn/nexus nexus
docker build --rm -t wolffaxn/sonarqube sonarqube

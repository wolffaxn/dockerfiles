#!/usr/bin/env bash

docker build --rm -t wolffaxn/centos7/base base
docker build --rm -t wolffaxn/centos7/oracle-java8 oracle-java8
docker build --rm -r wolffaxn/centos7/postgresql
docker build --rm -t wolffaxn/centos7/tomcat7 tomcat7
docker build --rm -t wolffaxn/centos7/tomcat8 tomcat8
docker build --rm -t wolffaxn/centos7/jenkins jenkins
docker build --rm -t wolffaxn/centos7/nexus nexus
docker build --rm -t wolffaxn/centos7/sonarqube sonarqube
docker build --rm -t wolffaxn/centos7/wildfly wildfly

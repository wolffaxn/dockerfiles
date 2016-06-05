#!/usr/bin/env bash

docker build --rm -t wolffaxn/base/centos7 base
docker build --rm -t wolffaxn/java/centos7 java
docker build --rm -r wolffaxn/postgresql/centos7 postgresql
docker build --rm -t wolffaxn/tomcat7/centos7 tomcat7
docker build --rm -t wolffaxn/tomcat8/centos7 tomcat8
docker build --rm -t wolffaxn/jenkins/centos7 jenkins
docker build --rm -t wolffaxn/nexus/centos7 nexus
docker build --rm -t wolffaxn/sonarqube/centos7 sonarqube
docker build --rm -t wolffaxn/wildfly/centos7 wildfly

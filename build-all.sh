#!/usr/bin/env bash

docker build --rm -t wolffaxn/base base/centos7
docker build --rm -t wolffaxn/java java/centos7
docker build --rm -r wolffaxn/postgresql postgresql/centos7
docker build --rm -t wolffaxn/jenkins jenkins/centos7
docker build --rm -t wolffaxn/nexus nexus/centos7
docker build --rm -t wolffaxn/sonarqube sonarqube/centos7
docker build --rm -t wolffaxn/wildfly wildfly/centos7

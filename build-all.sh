#!/usr/bin/env bash

docker build --rm -t wolffaxn/base base
docker build --rm -t wolffaxn/java java
docker build --rm -r wolffaxn/postgresql postgresql
docker build --rm -t wolffaxn/jenkins jenkins
docker build --rm -t wolffaxn/nexus nexus
docker build --rm -t wolffaxn/sonarqube sonarqube
docker build --rm -t wolffaxn/wildfly wildfly

# dockerfiles

[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/wolffaxn/dockerfiles/master/LICENSE)

A set of Java related Dockerfiles.

## Setup

1) Install dependencies

* [CoreOS](https://coreos.com) 1185.3.0 or greater.
* [Vagrant](https://www.vagrantup.com) 1.8.1 or greater.
* [VirtualBox](https://www.virtualbox.org) 5.0.30 or greater.

2) Clone this project.

```
git clone https://github.com/wolffaxn/dockerfiles.git
cd dockerfiles
```

3) Install vagrant plugins

```
vagrant plugin install vagrant-cachier
vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-vbguest
```

4) Startup and SSH

```
vagrant up
vagrant ssh
```

5) Get started [using CoreOS](https://coreos.com/docs/using-coreos)

### Shared folder setup

The Vagrantfile contains a shared folder setup.

```
# NFS requires a host-only network to be created
config.vm.network :private_network, ip: "192.168.2.10"

# enable NFS for sharing the host machine into the coreos-vagrant VM
config.vm.synced_folder ".", "/home/core/vagrant", id: "core", :nfs => true, :mount_options => ['nolock,vers=3,udp']
```

After 'vagrant up' you will be prompted for your local machine password.

## Building

After login change into the NFS folder 'vagrant'.

```
cd /home/core/vagrant
```

Run the following commands to build all images with docker.

```
docker build --rm -t wolffaxn/base base/centos7
docker build --rm -t wolffaxn/java java/centos7
docker build --rm -r wolffaxn/postgresql postgresql/centos7
docker build --rm -t wolffaxn/jenkins jenkins/centos7
docker build --rm -t wolffaxn/nexus nexus/centos7
docker build --rm -t wolffaxn/sonarqube sonarqube/centos7
docker build --rm -t wolffaxn/wildfly wildfly/centos7
```

## Running

```
docker run -d -p 2021:22 -p 8081:8080 --name=jenkins -t -i wolffaxn/jenkins
docker run -d -p 2022:22 -p 8082:8080 --name=nexus -t -i wolffaxn/nexus
docker run -d -p 2023:22 -p 8083:8080 --name=sonarqube -t -i wolffaxn/sonarqube
```

## License

Copyright 2014-2017 Alexander Wolff, Licensed under the MIT License.

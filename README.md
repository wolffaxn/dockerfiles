# dockerfiles

This repository contains a set of Dockerfiles for various application stacks.

## Setup

1) Install dependencies

* [CoreOS](https://coreos.com) 410.2.0 or greater.
* [Vagrant](https://www.vagrantup.com) 1.6.0 or greater.
* [VirtualBox](https://www.virtualbox.org) 4.3.16 or greater.

2) Clone this project.

```
git clone https://github.com/wolffaxn/dockerfiles.git
cd dockerfiles
```
3) Startup and SSH

```
vagrant up
vagrant ssh
```

4) Get started [using CoreOS](https://coreos.com/docs/using-coreos)

### Shared folder setup

The Vagrantfile contains a shared folder setup.

```
# NFS requires a host-only network to be created
config.vm.network :private_network, ip: "192.168.2.10"

# enable NFS for sharing the host machine into the coreos-vagrant VM
config.vm.synced_folder ".", "/home/core/vagrant", id: "core", :nfs => true, :mount_options => ['nolock,vers=3,udp']
config.vm.synced_folder "#{ENV['HOME']}/.vagrant-share", "/home/core/vagrant-share", id: "share", :nfs => true, :mount_options => ['nolock,vers=3,udp']
```

After a 'vagrant up' you will be prompted for your local machine password.

## Building

After login change into the NFS folder 'vagrant'.

```
cd /home/core/vagrant
```

Run the following commands to build all images with docker.

```
docker build --rm -t wolffaxn/base base
docker build --rm -t wolffaxn/java java
docker build --rm -t wolffaxn/tomcat tomcat
docker build --rm -t wolffaxn/jenkins jenkins
docker build --rm -t wolffaxn/nexus nexus
docker build --rm -t wolffaxn/sonarqube sonarqube
```

## Running

```
docker run -d -p 2021:22 -p 8081:8080 --name=jenkins -t -i wolffaxn/jenkins
docker run -d -p 2022:22 -p 8082:8080 --name=nexus -t -i wolffaxn/nexus
docker run -d -p 2023:22 -p 8083:8080 --name=sonarqube -t -i wolffaxn/sonarqube
```

## License

Copyright 2014 Alexander Wolff, Licensed under the MIT License.

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

Run the following commands to build all images with docker.

```
docker build --no-cache --rm -t wolffaxn/base base
```

## License

Copyright 2014 Alexander Wolff, Licensed under the MIT License.

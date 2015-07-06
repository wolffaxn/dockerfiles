# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.7.2"

BOXNAME = "dockerbox"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # cache downloaded files
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  # CoreOS
  config.vm.box = "coreos-stable"
  config.vm.box_version = ">= 681.2.0"
  config.vm.box_url = "http://stable.release.core-os.net/amd64-usr/current/coreos_production_vagrant.json"

  # time in seconds that Vagrant will wait for the machine to boot
  config.vm.boot_timeout = 300

  # disable automatic box update checking
  config.vm.box_check_update = false

  # the hostname the machine should have
  config.vm.hostname = "#{BOXNAME}.localdomain"

  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end

  config.vm.provider "virtualbox" do |vb|
    vb.name = BOXNAME

    # vbox guest additions and vboxsf
    vb.check_guest_additions = false
    vb.functional_vboxsf = false

    # disable vbox gui
    vb.gui = false

    vb.customize ["modifyvm", :id, "--hwvirtex", "off"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--audio", "none"]
    vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    vb.customize ["modifyvm", :id, "--nictype2", "virtio"]    
  end

  # NFS requires a host-only network to be created
  config.vm.network :private_network, ip: "192.168.2.10"

  # enable NFS for sharing the host machine into the coreos-vagrant VM
  config.vm.synced_folder ".", "/home/core/vagrant", id: "core", :nfs => true, :mount_options => ['nolock,vers=3,udp']
  config.vm.synced_folder "#{ENV['HOME']}/.vagrant-share", "/home/core/vagrant-share", id: "share", :nfs => true, :mount_options => ['nolock,vers=3,udp']

end

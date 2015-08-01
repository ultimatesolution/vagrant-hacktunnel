# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # --------------------------------------------------------------------
  # Definitions for the VirtualBox machine
  # --------------------------------------------------------------------
  config.vm.define "virtualbox", autostart: true do |vbox|
    vbox.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
    vbox.vm.box = "ubuntu/trusty64"
    vbox.vm.network "forwarded_port", guest: 80, host: 8080
    vbox.vm.network "forwarded_port", guest: 2000, host: 2000
    vbox.vm.network "forwarded_port", guest: 3000, host: 3000
    vbox.vm.provision :ansible do |ansible|
      ansible.playbook = "playbook.yml"
    end
    # Install nodejs
    #vbox.vm.provision "shell", privileged: false, path: "setup-nodejs.sh"
    # Tell the user what to do next
	vbox.vm.provision "shell", inline: "echo 'Finished! Now try logging in with: vagrant ssh; then /vagrant/setup-dev-env.sh'"
  end

end

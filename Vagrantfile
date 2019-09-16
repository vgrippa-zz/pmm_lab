# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"
  config.ssh.forward_agent = true
  config.ssh.insert_key = false
############# Postgres ######################
  config.vm.define "pg-master" do |server|
    server.vm.hostname = 'pg-master'
    server.vm.network :private_network, ip: '10.0.0.10'
  end

  config.vm.define "pg-replica" do |server|
    server.vm.hostname = 'pg-replica'
    server.vm.network :private_network, ip: '10.0.0.11'
  end

############# MySQL ######################
  config.vm.define "pxc-node1" do |server|
    server.vm.hostname = 'pxc-node1'
    server.vm.network :private_network, ip: '10.0.0.21'
  end

  config.vm.define "pxc-node2" do |server|
    server.vm.hostname = 'pxc-node2'
    server.vm.network :private_network, ip: '10.0.0.22'
  end

  config.vm.define "pxc-node3" do |server|
    server.vm.hostname = 'pxc-node3'
    server.vm.network :private_network, ip: '10.0.0.23'
  end

  config.vm.define "mysql-replica" do |server|
    server.vm.hostname = 'mysql-replica'
    server.vm.network :private_network, ip: '10.0.0.24'
  end
##
##  config.vm.define "app-server" do |server|
##    server.vm.hostname = 'app-server'
##    server.vm.network :private_network, ip: '10.0.0.12'
##    server.vm.provider "virtualbox" do |v|
##      v.cpus = 3
##    end
##  end

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "provision/playbook_mysql.yml"
  end

  ############# MongoDB ######################
  N = 3
  (1..N).each do |machine_id|
    config.vm.define "mongo#{machine_id}" do |machine|
      machine.vm.hostname = "mongo#{machine_id}"
      machine.vm.network "private_network", ip: "10.0.0.#{13+machine_id}"
      machine.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "2048"]
          vb.customize ["modifyvm", :id, "--cpus", "2"]

      # Only execute once the Ansible provisioner,
      # when all the machines are up and ready.
      if machine_id == N
        machine.vm.provision :ansible do |ansible|
          # Disable default limit to connect to all the machines
          ansible.limit = "all"
          ansible.verbose = "v"
          ansible.playbook = "provision/playbook_mongo.yml"
          ansible.inventory_path = "provision/hosts"
          end
        end
      end
    end
  end
end

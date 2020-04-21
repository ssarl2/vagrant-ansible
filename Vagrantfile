# -*- mode: ruby -*-
# vi: set ft=ruby :

# use Vagrant_API_Version 2
Vagrant.configure("2") do |config|

  #==============#
  # CentOS nodes #
  #==============#

  #Ansible-Node01
  config.vm.define "ansible-node01" do |cfg|
    cfg.vm.box = "centos/7"
    cfg.vm.provider "virtualbox" do |vb|
      vb.name = "Ansible-Node01(github_SysNet4Admin)"
    end
    cfg.vm.host_name = "ansible-node01"
    cfg.vm.network "public_network", ip: "192.168.1.11"
    cfg.vm.network "forwarded_port", guest: 22, host: 60011, auto_correct: true, id: "ssh"
    cfg.vm.synced_folder "../data", "/vagrant", disabled: true
    cfg.vm.provision "shell", path: "bash_ssh_conf_4_CentOS.sh"
  end
  
  #Ansible_Node02
  config.vm.define "ansible-node02" do |cfg|
    cfg.vm.box = "centos/7"
    cfg.vm.provider "virtualbox" do |vb|
      vb.name = "Ansible-Node02(github_SysNet4Admin)"
    end
    cfg.vm.host_name = "ansible-node02"
    cfg.vm.network "public_network", ip: "192.168.1.12"
    cfg.vm.network "forwarded_port", guest: 22, host: 60012, auto_correct: true, id: "ssh"
    cfg.vm.synced_folder "../data", "/vagrant", disabled: true
    cfg.vm.provision "shell", path: "bash_ssh_conf_4_CentOS.sh"
  end

  #Ansible_Node03
  config.vm.define "ansible-node03" do |cfg|
    cfg.vm.box = "centos/7"
    cfg.vm.provider "virtualbox" do |vb|
      vb.name = "Ansible-Node03(github_SysNet4Admin)"
    end
    cfg.vm.host_name = "ansible-node03"
    cfg.vm.network "public_network", ip: "192.168.1.13"
    cfg.vm.network "forwarded_port", guest: 22, host: 60013, auto_correct: true, id: "ssh"
    cfg.vm.synced_folder "../data", "/vagrant", disabled: true
    cfg.vm.provision "shell", path: "bash_ssh_conf_4_CentOS.sh"
  end

  #==============#
  # Ubuntu nodes #
  #==============#
  # You can check name of images on vagrant cloud

  #Ansible-Node04
  config.vm.define "ansible-node04" do |cfg|
    cfg.vm.box = "ubuntu/trusty64"
    cfg.vm.provider "virtualbox" do |vb|
      vb.name = "Ansible_Node04(github_SysNet4Admin)"
    end
    cfg.vm.host_name = "ansible-node04"
    cfg.vm.network "public_network", ip: "192.168.1.14"
    cfg.vm.network "forwarded_port", guest: 22, host: 60014, auto_correct: true, id: "ssh"
    cfg.vm.synced_folder "../data", "/vagrant", disabled: true
  end

  #Ansible-Node05
  config.vm.define "ansible-node05" do |cfg|
    cfg.vm.box = "ubuntu/trusty64"
    cfg.vm.provider "virtualbox" do |vb|
      vb.name = "Ansible-Node05(github_SysNet4Admin)"
    end
    cfg.vm.host_name = "ansible-node05"
    cfg.vm.network "public_network", ip: "192.168.1.15"
    cfg.vm.network "forwarded_port", guest: 22, host: 60015, auto_correct: true, id: "ssh"
    cfg.vm.synced_folder "../data", "/vagrant", disabled: true
  end

  #Ansible-Node06
  config.vm.define "ansible-node06" do |cfg|
    cfg.vm.box = "ubuntu/trusty64"
    cfg.vm.provider " virtualbox" do |vb|
      vb.name = "Ansible-Node06(github_SysNet4Admin)"
    end
    cfg.vm.host_name = "ansible-node06"
    cfg.vm.network "public_network", ip: "192.168.1.16"
    cfg.vm.network "forwarded_port", guest: 22, host: 60016, auto_correct: true, id: "ssh"
    cfg.vm.synced_folder "../data", "/vagrant", disabled: true
  end

  #================#
  # Ansible Server #
  #================#

  config.vm.define "ansible-server" do |cfg|
    # config.vm.define(ansible-server).vm.box ...
    cfg.vm.box = "centos/7"
    cfg.vm.provider "virtualbox" do |vb|
      vb.name = "Ansible-Server(github_SysNet4Admin)"
    end
    cfg.vm.host_name = "ansible-server"
    cfg.vm.network "public_network", ip: "192.168.1.10"
    # auto_correct: prevent using duplicate port
    # id: "ssh" is to use ssh explicitly
    # Refer to page. 101
    cfg.vm.network "forwarded_port", guest: 22, host: 60010, auto_correct: true, id: "ssh"
    # We won't use directory synchronize, "/vagrant" is necessary to use 'disabled'
    cfg.vm.synced_folder "../data", "/vagrant", disabled: true
    cfg.vm.provision "shell", inline: "yum install ansible -y"
    cfg.vm.provision "file", source: "ansible_env_ready.yml", destination: "ansible_env_ready.yml"
    cfg.vm.provision "shell", inline: "ansible-playbook ansible_env_ready.yml"
    cfg.vm.provision "shell", path: "add_ssh_auth.sh", privileged: false
    cfg.vm.provision "file", source: "nginx_install.yml", destination: "nginx_install.yml"
    cfg.vm.provision "file", source: "nginx_remove.yml", destination: "nginx_remove.yml"
    cfg.vm.provision "file", source: "timezone.yml", destination: "timezone.yml"
    cfg.vm.provision "file", source: "nfs.yml", destination: "nfs.yml"
  end
end
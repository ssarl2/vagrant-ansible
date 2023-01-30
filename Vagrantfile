# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/focal64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.1.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network "public_network", ip: "192.168.1.99"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "portal", "/home/vagrant/Desktop/portal", 
    create: true, owner: "vagrant", group: "vagrant"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
    vb.cpus = 2

    # Some example of how to use if
    #if RUBY_PLATFORM =~ /darwin/
    #  vb.customize ["modifyvm", :id, '--audio', 'coreaudio', '--audiocontroller', 'hda']
    #elsif RUBY_PLATFORM =~ /mingw|mswin|bccwin|cygwin|emx/
    #  vb.customize ["modifyvm", :id, '--audio', 'dsound', '--audiocontroller', 'ac97']
    #elsif RUBY_PLATFORM =~ /linux/
    #  vb.customize 
    #end

    # Available Oracle customization options
    # https://docs.oracle.com/en/virtualization/virtualbox/6.0/user/vboxmanage-modifyvm.html
    # https://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm-other
      vb.customize [
      "modifyvm", :id,
      "--vram", "64",
      "--cableconnected1", "on",
      "--accelerate2dvideo", "on",
      "--accelerate3d", "on"
    ]
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    # install GUI
    sudo apt-get update
    sudo apt-get install -y ubuntu-desktop

    # some video players are not supported in firefox
    sudo apt-get install -y ffmpeg
    
    # install ansible
    sudo apt-get install -y software-properties-common
    # reason of looking special sed
    # https://stackoverflow.com/questions/43650805/sed-error-in-vagrant-provision-but-ok-in-manual-execute
    sudo sed -i -e 's$#precedence ::ffff:0:0/96  100$precedence ::ffff:0:0/96  100$g' /etc/gai.conf
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install -y ansible

    # run ansible playbook
    ansible-playbook /home/vagrant/Desktop/portal/learn_ansible.yml -u root

    # get to work with GUI
    reboot

    # change resolution
    # xrandr -s 1920x1200
  SHELL
end

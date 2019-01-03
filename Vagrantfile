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
  config.vm.box = "bento/ubuntu-18.04"
  # config.vm.box = "ubuntu/ubuntu-18.04"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 22, host: 2222, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "../mc_docker_bakery_work", "/opt/mc_docker_bakery_work", create: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Install checkout script.
  config.vm.provision "file", source: "install-build-scripts.sh", destination: "/opt/mc_docker_bakery_work/install-build-scripts.sh"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
  #  apt-get update
    # install docker (Not docker compose because of X11 bug in credentials helper)
    sudo apt-get install -y docker.io
    sudo usermod -a -G docker vagrant
	sudo systemctl start docker
    sudo systemctl enable docker
 
    sudo apt-get install -y git emacs-nox
    git config --global --unset core.autocrlf

    sudo apt-get install -y openjdk-8-jdk
    sudo apt-get install -y python-pip

    #  python -m pip install --upgrade --user awscli
    sudo pip install --upgrade awscli

    # Create working directory, if not exists.
    mkdir -p /opt/mc_docker_bakery_work
    cd /opt/mc_docker_bakery_work

    # Prepare installation of docker image build scripts.
	echo '******************************************************'
    sudo chmod +x install-build-scripts.sh
	echo ' run <git config --global user.email YOUR-EMAILADDRESS> to configure git' 
    echo ' Run </opt/mc_docker_bakery_work/install-build-scripts.sh "/opt/mc_docker_bakery_work"> '
	echo ' to install docker build scripts to /opt/mc_docker_bakery_work '
	echo ' This path is mapped to the synced folder "mc_docker_bakery_work" '
	echo ' on your host for easy file editing. '
	echo ' Before running individual docker image build scripts configure the '
	echo ' build environmennt, i.e. copy environment setup script to /opt/mc_docker_bakery_work. '
	echo '******************************************************'

  SHELL
end

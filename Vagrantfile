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
  config.vm.box = "bento/ubuntu-21.04"
  # config.vm.box = "ubuntu/ubuntu-18.04"
  config.vm.box_version = "202107.28.0"
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  config.vm.network "forwarded_port", guest: 25565, host: 25565

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 25565, host: 25565, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  #config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  
  # Commented out because of issues with building the spigot jar. 
  # Building the spigot jar does not work on y synced folder. The build.sh script
  # should be changed to build the spigot jar in a different folder (tmp?).
  # config.vm.synced_folder "../mc_docker_bakery_work", "/opt/mc_docker_bakery_work", create: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
  
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Install checkout script.
#  config.vm.provision "file", source: "install-build-scripts.sh", destination: "/opt/mc_docker_bakery_work/install-build-scripts.sh"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    function errchk {
        local exitcode=$?
        local msg=$1
        if test "$exitcode" -ne "0" ; then
            echo "(Exit code: $exitcode) ${msg:-error}"
            exit $exitcode
        fi
    }

    echo '+++++ Disable debconf for interactive preconfiguring packages +++++'
    sudo ex +"%s@DPkg@//DPkg" -cwq /etc/apt/apt.conf.d/70debconf
    sudo dpkg-reconfigure debconf -f noninteractive -p critical
    # Tell dpkg to restart services without asking.
    echo '* libraries/restart-without-asking boolean true' | sudo debconf-set-selections
    # Alternate method if debconf is needed.
    export DEBIAN_FRONTEND=noninteractive

    echo '+++++ Updating package index +++++'
    sudo apt-get -qy update  > /dev/null 
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."

    # install docker (Not docker compose because of X11 bug in credentials helper)
    echo '+++++ Installing docker +++++'
    sudo apt-get -qy install docker.io > /dev/null 
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."
    sudo usermod -a -G docker vagrant 
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."
	sudo systemctl start docker 
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."
    sudo systemctl enable docker 
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."
 
    echo '+++++ Installing git +++++'
    sudo apt-get -qy install git > /dev/null
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."
    sudo git config --global --unset core.autocrlf 

    echo '+++++ Installing jq +++++'
    sudo apt-get -qy install jq > /dev/null
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."

    echo '+++++ Installing emacs editor +++++'
	sudo apt-get -qy install emacs-nox > /dev/null 
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."

    echo '+++++ Installing JDK(s) +++++'
    sudo apt-get -qy install openjdk-16-jdk > /dev/null 
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."
    sudo apt-get -qy install openjdk-17-jdk > /dev/null 
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."

    echo '+++++ Installing awscli +++++'
    #sudo apt-get -qy install python-pip > /dev/null 
    #errchk "{$LINENO}: Error provisioning box. Exiting provision script."
    #  python -m pip install --upgrade --user awscli
    #sudo pip -q install --upgrade awscli > /dev/null 
    sudo apt-get -qy install awscli > /dev/null
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."

    echo '+++++ Installing python3 pip +++++'
    sudo apt-get -qy install python3-pip > /dev/null 
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."

    export work_dir='/opt/mc_docker_bakery_work'
    echo "+++++ Setting up working directory ${work_dir} +++++"
    sudo mkdir -p  ${work_dir}
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."
	sudo chown vagrant ${work_dir}
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."
	sudo chgrp vagrant ${work_dir}
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."
    cd ${work_dir}
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."
	
	cp /vagrant/install-build-scripts.sh ${work_dir} 
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."
	chmod +x ${work_dir}/install-build-scripts.sh 
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."
	chown vagrant ${work_dir}
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."
	chgrp vagrant ${work_dir}
    errchk "{$LINENO}: Error provisioning box. Exiting provision script."
	
    if [ ! -e ~vagrant/mc_docker_bakery_work ] ; then
	    ln -s ${work_dir} ~vagrant/ 
        errchk "{$LINENO}: Error provisioning box. Exiting provision script."
    fi

	echo '******************************************************'
    echo ' After logging in to vagrant box: '
    echo ''
    echo ' run <git config --global user.email YOUR-EMAILADDRESS> to configure git' 
    echo ''
    echo " run </vagrant/install-build-scripts.sh ${work_dir}> "
	echo " to install docker build scripts to ${work_dir} "
#	echo ' This path is mapped to the synced folder "mc_docker_bakery_work" '
#	echo ' on your host for easy file editing. '
    echo ''
	echo ' Before running individual docker image build scripts configure the '
	echo " build environment, i.e. create environment setup script in ${work_dir}. "
	echo '******************************************************'

  SHELL
end

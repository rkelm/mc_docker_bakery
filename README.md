# mc_docker_bakery
State: RELEASED
Vagrant setup files for a virtual ubuntu virtualbox machine to build Minecraft docker images.

Requirements: 
- HashiCorp Vagrant installed. 
- Oracle VirtualBox installed.

Usage:
- Clone repo or install files locally.
- Run "vagrant up" to provision and start up the vm.
- Run "vagrant ssh" to work in machine.
- Change working directory to /opt/mc_docker_bakery_work.
- Run /opt/mc_docker_bakery_work/install-build-scripts.sh 
  to install the build files for creating the docker images.
- Set necessary environment variables, (i.e. provision script 
  to set environment variables in synced folder 
  "source /vagrant/set_docker_build_env_vars.sh).
- Run build.sh script in each project directory. The build.sh 
  scripts may have more requirements.
- Push images to your docker repository.

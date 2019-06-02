REM Batch file to fix network connectivity of vagrant/VBox guest after host standby/hybernate. 
VBoxManage controlvm mc_docker_bakery_default_1546622094946_67594 setlinkstate1 off
VBoxManage controlvm mc_docker_bakery_default_1546622094946_67594 setlinkstate1 on



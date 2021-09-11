REM Batch file to fix network connectivity of vagrant/VBox guest after host standby/hybernate.
REM Name of vm needs to be edited to match the installed vms name. 
VBoxManage controlvm mc_docker_bakery_default_1546622094946_67594 setlinkstate1 off
VBoxManage controlvm mc_docker_bakery_default_1546622094946_67594 setlinkstate1 on



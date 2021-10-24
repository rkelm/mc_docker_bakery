REM Batch file to fix network connectivity of vagrant/VBox guest after host standby/hybernate.
REM Name of vm needs to be edited to match the installed vms name. 
REM run VBoxManage.exe list vms to view list vm names.
REM VBoxManage command should be located in Program Files/Oracle/VirtualBox/VBoxManage.exe

"C:\Program Files/Oracle/VirtualBox/VBoxManage.exe" controlvm mc_docker_bakery_default_1635106643904_4060 setlinkstate1 off
"C:\Program Files/Oracle/VirtualBox/VBoxManage.exe" controlvm mc_docker_bakery_default_1635106643904_4060 setlinkstate1 on


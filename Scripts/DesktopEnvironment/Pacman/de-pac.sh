#!/bin/bash

#Get the necessary components
pacman -Sy --noconfirm lxde tigervnc

#Setup the necessary files
mkdir ~/.vnc
wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/DesktopEnvironment/Pacman/xstartup -P ~/.vnc/
wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/DesktopEnvironment/Pacman/vncserver -P /etc/init.d/
chmod +x ~/.vnc/xstartup
chmod +x /etc/init.d/vncserver

echo " "
echo "You can now start vncserver by running /etc/init.d/vncserver start"
echo " "
echo "It will ask you to enter a password when first time starting it."
echo " "
echo "The VNC Server will be started at 127.0.0.1:5901"
echo " "
echo "You can connect to this address with a VNC Viewer you prefer"
echo " "
echo "Connect to this address will open a window with full LXDE Desktop Environment"
echo " "
echo " "
echo " "
echo "Running /etc/init.d/vncserver start"
echo " "
echo " "
echo " "

/etc/init.d/vncserver start

#!/bin/bash

#Get the component
apt-get update
apt-get install xterm tightvncserver wget

#Setup the necessary files
mkdir ~/.vnc
wget https://raw.githubusercontent.com/EXALAB/LinuxOnAndroid/master/Scripts/GUI/Apt/xstartup -P ~/.vnc/
wget https://raw.githubusercontent.com/EXALAB/LinuxOnAndroid/master/Scripts/GUI/Apt/vncserver -P /etc/init.d/
chmod +x ~/.vnc/xstartup
chmod +x /etc/init.d/vncserver

echo "You can now start vncserver by running /etc/init.d/vncserver start"
echo "It will ask you to enter a password when first time starting it."
echo "The VNC Server will be started at 127.0.0.1:5901"
echo "Connect to this address will open a window with xterm"
echo "You can run any GUI program in xterm, and close them with CTRl+C"
echo "Hacker Keyboard is recommended if you want to use the GUI, it could be install from Play Store"

/etc/init.d/vncserver start
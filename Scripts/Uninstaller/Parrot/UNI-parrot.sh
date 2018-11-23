#!/data/data/com.termux/files/usr/bin/bash

echo "Starting to uninstall, please be patient..."

chmod 777 -R parrot-fs/*
rm -rf parrot-fs
rm -rf parrot-binds
rm parrot.sh
rm start-parrot.sh
rm ssh-apt.sh
rm de-apt.sh
rm de-apt-xfce4.sh
rm de-apt-mate.sh
rm de-apt-lxqt.sh
rm de-apt-lxde.sh
rm UNI-parrot.sh

echo "Done"

#!/data/data/com.termux/files/usr/bin/bash

echo "Starting to uninstall, please be patient..."

chmod 777 -R debian-fs/*
rm -rf debian-fs
rm -rf debian-binds
rm debian.sh
rm start-debian.sh
rm ssh-apt.sh
rm de-apt.sh
rm de-apt-xfce4.sh
rm de-apt-mate.sh
rm de-apt-lxqt.sh
rm de-apt-lxde.sh
rm UNI-debian.sh

echo "Done"

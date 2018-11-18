#!/data/data/com.termux/files/usr/bin/bash

echo "Starting to uninstall, please be patient..."

chmod 777 -R debian-fs/*
rm -rf debian-fs
rm -rf debian-binds
rm debian.sh
rm start-debian.sh
rm ssh-apt.sh
rm de-apt.sh
rm UNI-debian.sh

echo "Done"

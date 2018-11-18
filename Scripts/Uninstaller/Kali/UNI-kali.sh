#!/data/data/com.termux/files/usr/bin/bash

echo "Starting to uninstall, please be patient..."

chmod 777 -R kali-fs/*
rm -rf kali-fs
rm -rf kali-binds
rm kali.sh
rm start-kali.sh
rm ssh-apt.sh
rm de-apt.sh
rm UNI-kali.sh

echo "Done"

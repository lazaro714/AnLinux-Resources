#!/data/data/com.termux/files/usr/bin/bash

echo "Starting to uninstall, please be patient..."

chmod 777 -R parrot-fs/*
rm -rf parrot-fs
rm -rf parrot-binds
rm parrot.sh
rm start-parrot.sh
rm ssh-apt.sh
rm de-apt.sh
rm UNI-parrot.sh

echo "Done"

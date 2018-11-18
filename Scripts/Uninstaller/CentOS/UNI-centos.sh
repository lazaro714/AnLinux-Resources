#!/data/data/com.termux/files/usr/bin/bash

echo "Starting to uninstall, please be patient..."

chmod 777 -R centos-fs/*
rm -rf centos-fs
rm -rf centos-binds
rm centos.sh
rm start-centos.sh
rm ssh-yum.sh
rm UNI-centos.sh

echo "Done"

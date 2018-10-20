#!/data/data/com.termux/files/usr/bin/bash

echo "Starting to uninstall, please be patient..."

chmod 777 -R fedora-fs/*
rm -rf fedora-fs
rm -rf fedora-binds
rm fedora-rootfs.tar.gz
rm fedora.sh
rm start-fedora.sh
rm ssh-yum.sh
rm de-yum.sh
rm UNI-fedora.sh

echo "Done"

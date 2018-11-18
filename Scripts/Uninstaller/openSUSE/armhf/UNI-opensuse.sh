#!/data/data/com.termux/files/usr/bin/bash

echo "Starting to uninstall, please be patient..."

chmod 777 -R opensuse-fs/*
rm -rf opensuse-fs
rm -rf opensuse-binds
rm opensuse.sh
rm start-opensuse.sh
rm UNI-opensuse.sh

echo "Done"

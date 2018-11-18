#!/data/data/com.termux/files/usr/bin/bash

echo "Starting to uninstall, please be patient..."

chmod 777 -R opensuse-leap-fs/*
rm -rf opensuse-leap-fs
rm -rf opensuse-leap-binds
rm opensuse-leap.sh
rm start-leap.sh
rm UNI-opesuse-leap.sh

echo "Done"

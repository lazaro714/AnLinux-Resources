#!/data/data/com.termux/files/usr/bin/bash

echo "Starting to uninstall, please be patient..."

chmod 777 -R opensuse-tumbleweed-fs/*
rm -rf opensuse-tumbleweed-fs
rm -rf opensuse-tumbleweed-binds
rm opensuse-tumbleweed.sh
rm start-tumbleweed.sh
rm UNI-opesuse-tumbleweed.sh

echo "Done"

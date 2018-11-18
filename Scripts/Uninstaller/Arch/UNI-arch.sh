#!/data/data/com.termux/files/usr/bin/bash

echo "Uninstalling], please be patient..."

chmod 777 -R arch-fs/*
rm -rf arch-fs
rm -rf arch-binds
rm arch.sh
rm start-arch.sh
rm ssh-pac.sh
rm de-pac.sh
rm UNI-arch.sh

echo "Done"

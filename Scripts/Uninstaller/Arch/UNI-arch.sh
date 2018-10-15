#!/data/data/com.termux/files/usr/bin/bash

echo "Uninstalling], please be patient..."

chmod 777 -R arch-fs/*
rm -rf arch-fs
rm -rf archbinds
rm arch-rootfs.tar.gz
rm arch.sh
rm start-arch.sh
rm UNI-arch.sh

echo "Done"

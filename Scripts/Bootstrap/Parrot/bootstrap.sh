#!/usr/bin/env bash

#Bootstrap the system
rm -rf $2
mkdir $2
if [ "$1" = "i386" ] || [ "$1" = "amd64" ] ; then
  debootstrap --no-check-gpg --arch=$1 --variant=minbase --include=systemd,libsystemd0,wget,ca-certificates stable $2 http://ba.mirror.garr.it/mirrors/parrot
else
  qemu-debootstrap --no-check-gpg --arch=$1 --variant=minbase --include=systemd,libsystemd0,wget,ca-certificates stable $2 http://ba.mirror.garr.it/mirrors/parrot
fi

#Reduce size
DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
 LC_ALL=C LANGUAGE=C LANG=C chroot $2 apt-get clean

#Setup DNS
echo "127.0.0.1 localhost" > $2/etc/hosts
echo "nameserver 8.8.8.8" > $2/etc/resolv.conf
echo "nameserver 8.8.4.4" >> $3/etc/resolv.conf

#sources.list setup
rm $2/etc/apt/sources.list
echo "deb http://ba.mirror.garr.it/mirrors/parrot stable main contrib non-free" >> $2/etc/apt/sources.list
echo "deb-src http://ba.mirror.garr.it/mirrors/parrot stable main contrib non-free" >> $2/etc/apt/sources.list
#Import the gpg key, this is only required in Parrot Security OS
wget http://archive.parrotsec.org/parrot/misc/archive.gpg -O $2/etc/apt/trusted.gpg.d/parrot-archive-key.asc

#tar the rootfs
cd $2
rm -rf ../parrot-rootfs-$1.tar.gz
rm -rf dev/*
GZIP=-9 tar -cvzf ../parrot-rootfs-$1.tar.gz ./*
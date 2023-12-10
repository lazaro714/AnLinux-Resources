#!/usr/bin/env bash

#Bootstrap the system
rm -rf $2
mkdir $2
if [ "$1" = "i386" ] || [ "$1" = "amd64" ] ; then
  debootstrap --no-check-gpg --arch=$1 --variant=minbase --include=systemd,systemd-shim,libsystemd0,wget,ca-certificates stretch $2 http://deb.debian.org/debian
else
  qemu-debootstrap --no-check-gpg --arch=$1 --variant=minbase --include=systemd,systemd-shim,libsystemd0,wget,ca-certificates stretch $2 http://deb.debian.org/debian
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
echo "deb http://deb.debian.org/debian stretch main contrib non-free" >> $2/etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian stretch main contrib non-free" >> $2/etc/apt/sources.list

#tar the rootfs
cd $2
rm -rf ../debian-rootfs-$1.tar.gz
rm -rf dev/*
GZIP=-9 tar -cvzf ../debian-rootfs-$1.tar.gz ./*

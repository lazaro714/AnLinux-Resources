#!/usr/bin/env bash

#Bootstrap the system
rm -rf $2
mkdir $2
if [ "$1" = "i386" ] ; then
  debootstrap --no-check-gpg --arch i386 --variant=minbase bionic $2 http://archive.ubuntu.com/ubuntu
else
  qemu-debootstrap --no-check-gpg --arch=$1 --variant=minbase bionic $2 http://archive.ubuntu.com/ubuntu
fi

#Reduce size
DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
 LC_ALL=C LANGUAGE=C LANG=C chroot $3 apt-get clean

#Setup DNS
echo "127.0.0.1 localhost" > $2/etc/hosts
echo "nameserver 8.8.8.8" > $2/etc/resolv.conf
echo "nameserver 8.8.4.4" >> $3/etc/resolv.conf

#sources.list setup
rm $2/etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu bionic main restricted universe multiverse" >> $2/etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu bionic main restricted universe multiverse" >> $2/etc/apt/sources.list

#tar the rootfs
cd $2
rm -rf ../ubuntu-rootfs-$1.tar.gz
rm -rf dev/*
GZIP=-9 tar -cvzf ../ubuntu-rootfs-$1.tar.gz ./*

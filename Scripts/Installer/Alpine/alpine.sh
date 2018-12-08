#!/data/data/com.termux/files/usr/bin/bash
folder=alpine-fs
if [ -d "$folder" ]; then
	first=1
	echo "skipping downloading"
fi
if [ "$first" != 1 ];then
	if [ ! -f alpine-rootfs-*.tar.* ]; then
		echo "Download Rootfs, this may take a while base on your internet speed."
		case `dpkg --print-architecture` in
		aarch64)
			archurl="arm64"
			tarball="alpine-rootfs.tar.gz"
			wget "https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Rootfs/Alpine/${archurl}/alpine-rootfs-${archurl}.tar.gz" -O $tarball
			cur=`pwd`
			mkdir -p "$folder"
			cd "$folder"
			echo "Decompressing Rootfs, please be patient."
			proot --link2symlink tar -xf ${cur}/${tarball} --exclude='dev'||:
			cd "$cur" ;;
		arm)
			archurl="armhf"
			tarball="alpine-rootfs.tar.gz"
			wget "https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Rootfs/Alpine/${archurl}/alpine-rootfs-${archurl}.tar.gz" -O $tarball
			cur=`pwd`
			mkdir -p "$folder"
			cd "$folder"
			echo "Decompressing Rootfs, please be patient."
			proot --link2symlink tar -xf ${cur}/${tarball} --exclude='dev'||:
			cd "$cur" ;;
		amd64)
			archurl="amd64"
			tarball="alpine-rootfs.tar.xz"
			wget "https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Rootfs/Alpine/${archurl}/alpine-rootfs-${archurl}.tar.xz" -O $tarball
			cur=`pwd`
			mkdir -p "$folder"
			cd "$folder"
			echo "Decompressing Rootfs, please be patient."
			proot --link2symlink tar -xJf ${cur}/${tarball} --exclude='dev'||:
			cd "$cur" ;;
		x86_64)
			archurl="amd64"
			tarball="alpine-rootfs.tar.xz"
			wget "https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Rootfs/Alpine/${archurl}/alpine-rootfs-${archurl}.tar.xz" -O $tarball
			cur=`pwd`
			mkdir -p "$folder"
			cd "$folder"
			echo "Decompressing Rootfs, please be patient."
			proot --link2symlink tar -xJf ${cur}/${tarball} --exclude='dev'||:
			cd "$cur" ;;
		i*86)
			archurl="i386"
			tarball="alpine-rootfs.tar.gz"
			wget "https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Rootfs/Alpine/${archurl}/alpine-rootfs-${archurl}.tar.gz" -O $tarball
			cur=`pwd`
			mkdir -p "$folder"
			cd "$folder"
			echo "Decompressing Rootfs, please be patient."
			proot --link2symlink tar -xf ${cur}/${tarball} --exclude='dev'||:
			cd "$cur" ;;
		x86)
			archurl="i386"
			tarball="alpine-rootfs.tar.gz"
			wget "https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Rootfs/Alpine/${archurl}/alpine-rootfs-${archurl}.tar.gz" -O $tarball
			cur=`pwd`
			mkdir -p "$folder"
			cd "$folder"
			echo "Decompressing Rootfs, please be patient."
			proot --link2symlink tar -xf ${cur}/${tarball} --exclude='dev'||:
			cd "$cur" ;;
		*)
			echo "unknown architecture"; exit 1 ;;
		esac
	fi
fi
mkdir -p alpine-binds
bin=start-alpine.sh
echo "writing launch script"
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r $folder"
if [ -n "\$(ls -A binds)" ]; then
    for f in binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b alpine-fs/tmp:/dev/shm"
## uncomment the following line to have access to the home directory of termux
#command+=" -b /data/data/com.termux/files/home:/root"
## uncomment the following line to mount /sdcard directly to / 
#command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM

echo "fixing shebang of $bin"
termux-fix-shebang $bin
echo "making $bin executable"
chmod +x $bin
echo "removing image for some space"
rm $tarball
echo "You can now launch Alpine with the ./${bin} script"

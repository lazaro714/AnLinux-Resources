wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Library/Ashmem/libandroid-shmem-gnueabihf.so -P /usr/local/lib
wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Library/Ashmem/ld.so.preload -P /etc

export LD_PRELOAD=/usr/local/lib/libandroid-shmem-gnueabihf.so
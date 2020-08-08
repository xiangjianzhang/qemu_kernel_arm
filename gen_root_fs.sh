##########################################################################
# File Name: gen_root_fs.sh
# Author: jianzhang
# mail: xiang.jianzhang@163.com
# Created Time: 2020年04月28日 星期二 23时10分47秒
#########################################################################
#!/bin/bash

busbox_dir=$1
sudo rm -rf rootfs
sudo rm -rf tmpfs
sudo rm -f a9rootfs.ext2

sudo mkdir rootfs
sudo cp $busbox_dir/_install/* rootfs/ -av
sudo mkdir rootfs/lib
sudo mkdir rootfs/etc
sudo mkdir rootfs/etc/init.d
sudo mkdir rootfs/sys
sudo mkdir rootfs/proc
sudo mkdir rootfs/tmp
sudo mkdir rootfs/var
sudo mkdir rootfs/home
sudo cp rcS rootfs/etc/init.d/ -av

sudo cp toolchain/aarch64-linux-gnu/aarch64-linux-gnu/libc/*  rootfs/  -av
sudo mkdir -p rootfs/dev
sudo mknod rootfs/dev/tty1 c 4 1
sudo mknod rootfs/dev/tty2 c 4 2
sudo mknod rootfs/dev/tty3 c 4 3
sudo mknod rootfs/dev/tty4 c 4 4
sudo  cp rcS  /etc/init.d/

rm -fr rootfs.ext2 
touch rootfs.ext2 
truncate  --size 1G rootfs.ext2 
mkfs.ext2 rootfs.ext2

sudo mkdir tmpfs
sudo mount -t ext2 rootfs.ext2 tmpfs/ -o loop
sudo cp -r rootfs/* tmpfs/
sudo umount tmpfs



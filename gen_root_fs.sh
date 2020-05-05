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
sudo rm -f a9rootfs.ext3

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

#sudo cp -P /usr/arm-linux-gnueabi/lib/* rootfs/lib
sudo mkdir -p rootfs/dev
sudo mknod rootfs/dev/tty1 c 4 1
sudo mknod rootfs/dev/tty2 c 4 2
sudo mknod rootfs/dev/tty3 c 4 3
sudo mknod rootfs/dev/tty4 c 4 4
dd if=/dev/zero of=a9rootfs.ext3 bs=1M count=32
mkfs.ext3 a9rootfs.ext3

sudo mkdir tmpfs
sudo mount -t ext3 a9rootfs.ext3 tmpfs/ -o loop
sudo cp -r rootfs/* tmpfs/
sudo umount tmpfs



##########################################################################
# File Name: gen_root_fs.sh
# Author: jianzhang
# mail: xiang.jianzhang@163.com
# Created Time: 2020年04月28日 星期二 23时10分47秒
#########################################################################
#!/bin/bash

sudo rm -rf rootfs
sudo rm -rf tmpfs
sudo rm -f a9rootfs.ext3

#创建根目录rootfs
sudo mkdir rootfs
#复制busybox命令到根目录下，注意busybox路径！划重点！
sudo cp ../busybox-1.31.1/_install/* rootfs/ -av
#从工具链中复制运行库到lib目录下
#sudo mkdir rootfs/lib
#sudo cp -P /usr/arm-linux-gnueabi/lib/* rootfs/lib
#创建4个tty终端设备（c代表字符设备，4是主设备号，1 2 3 4分别是次设备号
sudo mkdir -p rootfs/dev
sudo mknod rootfs/dev/tty1 c 4 1
sudo mknod rootfs/dev/tty2 c 4 2
sudo mknod rootfs/dev/tty3 c 4 3
sudo mknod rootfs/dev/tty4 c 4 4
#生成镜像
dd if=/dev/zero of=a9rootfs.ext3 bs=1M count=32
#格式化生成ext3文件系统
mkfs.ext3 a9rootfs.ext3

#将文件复制到镜像中
sudo mkdir tmpfs
sudo mount -t ext3 a9rootfs.ext3 tmpfs/ -o loop
sudo cp -r rootfs/* tmpfs/
sudo umount tmpfs



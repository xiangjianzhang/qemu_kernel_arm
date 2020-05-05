##########################################################################
# File Name: start.sh
# Author: jianzhang
# mail: xiang.jianzhang@163.com
# Created Time: 2020年04月28日 星期二 23时13分16秒
#########################################################################
#!/bin/zsh
PATH=/home/edison/bin:/home/edison/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/work/tools/gcc-3.4.5-glibc-2.3.6/bin
export PATH
#!/bin/bash

qemu-system-arm \
	-M vexpress-a9 \
	-m 512M \
	-kernel ./image/zImage \
	-dtb ./image/vexpress-v2p-ca9.dtb \
	-nographic \
	-append "root=/dev/mmcblk0 console=ttyAMA0 rw init=/linuxrc" \
	-sd ./image/a9rootfs.ext3


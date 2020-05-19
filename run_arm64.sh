##########################################################################
# File Name: tmp.sh
# Author: jianzhang
# mail: xiang.jianzhang@163.com
# Created Time: 2020年05月12日 星期二 15时00分09秒
#########################################################################
#!/bin/zsh
PATH=/home/edison/bin:/home/edison/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/work/tools/gcc-3.4.5-glibc-2.3.6/bin
export PATH


qemu-system-aarch64 \
        -kernel ./image/Image \
        -nographic \
        -append "root=/dev/vda console=ttyAMA0 rootfstype=ext4 init=/linuxrc rw" \
        -m 2048M \
        -smp 4  \
        -M virt \
        -cpu cortex-a57 \
        -hda image/a9rootfs.ext3

##########################################################################
# File Name: get_source.sh
# Author: jianzhang
# mail: xiang.jianzhang@163.com
# Created Time: 2020年05月05日 星期二 12时56分01秒
#########################################################################
#!/bin/zsh
PATH=/home/edison/bin:/home/edison/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/work/tools/gcc-3.4.5-glibc-2.3.6/bin
export PATH

git clone https://github.com/xiangjianzhang/kernel_4.19.git
git clone https://github.com/xiangjianzhang/busy_box.git 

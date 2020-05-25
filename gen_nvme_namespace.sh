##########################################################################
# File Name: gen_nvme_namespace.sh
# Author: jianzhang
# mail: xiang.jianzhang@163.com
# Created Time: 2020年05月24日 星期日 19时04分51秒
#########################################################################
#!/bin/sh

for i in $(seq 0 31)
do
	tmp=$(printf "%02d\n" $i)
	tmp=nvme${tmp}.raw
	rm -fr $tmp
	echo "create ${tmp}"
	qemu-img create -f qcow2 -o size=1G  $tmp
done
ls -lh  nvme*

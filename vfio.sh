qemu-system-aarch64 \
	-kernel ./image/Image \
	-nographic \
	-append "root=/dev/vda console=ttyAMA0 rootfstype=ext3 init=/linuxrc rw" \
	-m 2048M \
	-smp 4  \
	-cpu cortex-a57 \
	-M virt \
	-hda image/rootfs.ext3 \
	\
	-device vfio-pci,host=00:03:0.0

#  has some issue
#    -device ioh3420,id=root_port6,chassis=7,slot=1,bus=pcie.0,addr=8, \
#    -device x3130-upstream,id=upstream_port1,bus=root_port6,addr=1, \
#    -device xio3130-downstream,id=downstream_port1,bus=upstream_port1,chassis=2,slot=0,addr=9 \
#	-device ioh3420,id=switch_root_port1,chassis=3,slot=0,bus=downstream_port1,addr=10,\
#	-drive  file=./nvme05.raw,id=D05,if=none, \
#	-device nvme,bus=switch_root_port1,drive=D05,serial=6605, \

#2.2.1 Plugging a PCI Express device into a PCI Express Root Port:
#	-device ioh3420,id=root_port1,chassis=x,slot=y[,bus=pcie.0][,addr=z]  \
#    -device <dev>,bus=root_port1
#2.2.2 Using multi-function PCI Express Root Ports:
#    -device ioh3420,id=root_port1,multifunction=on,chassis=x,addr=z.0[,slot=y][,bus=pcie.0] \
#    -device ioh3420,id=root_port2,chassis=x1,addr=z.1[,slot=y1][,bus=pcie.0] \
#    -device ioh3420,id=root_port3,chassis=x2,addr=z.2[,slot=y2][,bus=pcie.0] \
#2.2.3 Plugging a PCI Express device into a Switch:
#    -device ioh3420,id=root_port1,chassis=x,slot=y[,bus=pcie.0][,addr=z]  \
#    -device x3130-upstream,id=upstream_port1,bus=root_port1[,addr=x]          \
#    -device xio3130-downstream,id=downstream_port1,bus=upstream_port1,chassis=x1,slot=y1[,addr=z1]] \
#    -device <dev>,bus=downstream_port1
#

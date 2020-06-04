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
	-device ioh3420,id=root_port1,chassis=1,slot=1,bus=pcie.0,addr=3,\
	-drive file=./nvme00.raw,id=D00,if=none, \
	-device nvme,bus=root_port1,drive=D00,serial=6600, \
	\
	-device ioh3420,id=root_port2,chassis=2,slot=1,bus=pcie.0,addr=4,\
	-drive file=./nvme01.raw,id=D01,if=none, \
	-device nvme,bus=root_port2,drive=D01,serial=6601, \
	\
	-device ioh3420,id=root_port3,chassis=3,slot=1,bus=pcie.0,addr=5,\
	-drive file=./nvme02.raw,id=D02,if=none, \
	-device nvme,bus=root_port3,drive=D02,serial=6602, \
	\
	-device ioh3420,id=root_port4,chassis=4,slot=1,bus=pcie.0,addr=6,\
	-drive file=./nvme03.raw,id=D03,if=none, \
	-device nvme,bus=root_port4,drive=D03,serial=6603, \
	\
	-device ioh3420,id=root_port5,chassis=5,slot=1,bus=pcie.0,addr=7,\
	-drive file=./nvme04.raw,id=D04,if=none, \
	-device nvme,bus=root_port5,drive=D04,serial=6604, \
	\
    -device ioh3420,id=root_port6,multifunction=on,chassis=6,addr=8.0,slot=1,bus=pcie.0 \
	\
    -device ioh3420,id=root_port7,chassis=6,addr=8.1,slot=2,bus=pcie.0 \
	-drive file=./nvme05.raw,id=D05,if=none, \
	-device nvme,bus=root_port7,drive=D05,serial=6605, \
	\
    -device ioh3420,id=root_port8,chassis=7,addr=8.2,slot=3,bus=pcie.0 \
	-drive file=./nvme06.raw,id=D06,if=none, \
	-device nvme,bus=root_port8,drive=D06,serial=6606, \
	\
    -device ioh3420,id=root_port9_00,multifunction=on,chassis=100,addr=9.0,slot=1,bus=pcie.0 \
	-device ioh3420,id=root_port9_01,chassis=101,slot=1,bus=pcie.0,addr=9.1,\
	-device ioh3420,id=root_port9_02,chassis=102,slot=1,bus=pcie.0,addr=9.2,\
	-device ioh3420,id=root_port9_03,chassis=103,slot=1,bus=pcie.0,addr=9.3,\
	-device ioh3420,id=root_port9_04,chassis=104,slot=1,bus=pcie.0,addr=9.4,\
	-device ioh3420,id=root_port9_05,chassis=105,slot=1,bus=pcie.0,addr=9.5,\
	-device ioh3420,id=root_port9_06,chassis=106,slot=1,bus=pcie.0,addr=9.6,\
	-device ioh3420,id=root_port9_07,chassis=107,slot=1,bus=pcie.0,addr=9.7,\
	-device ioh3420,id=root_port0A,chassis=10,slot=1,bus=pcie.0,addr=0A,\
	-device ioh3420,id=root_port0B,chassis=11,slot=1,bus=pcie.0,addr=0B,\
	-device ioh3420,id=root_port0C,chassis=12,slot=1,bus=pcie.0,addr=0C,\
	-device ioh3420,id=root_port0D,chassis=13,slot=1,bus=pcie.0,addr=0D,\
	-device ioh3420,id=root_port0E,chassis=14,slot=1,bus=pcie.0,addr=0E,\
	-device ioh3420,id=root_port0F,chassis=15,slot=1,bus=pcie.0,addr=0F,\
	-device ioh3420,id=root_port10,chassis=16,slot=1,bus=pcie.0,addr=10,\
	-device ioh3420,id=root_port11,chassis=17,slot=1,bus=pcie.0,addr=11,\
	-device ioh3420,id=root_port12,chassis=18,slot=1,bus=pcie.0,addr=12,\
	-device ioh3420,id=root_port13,chassis=19,slot=1,bus=pcie.0,addr=13,\
	-device ioh3420,id=root_port14,chassis=20,slot=1,bus=pcie.0,addr=14,\
	-device ioh3420,id=root_port15,chassis=21,slot=1,bus=pcie.0,addr=15,\
	-device ioh3420,id=root_port16,chassis=22,slot=1,bus=pcie.0,addr=16,\
	-device ioh3420,id=root_port17,chassis=23,slot=1,bus=pcie.0,addr=17,\
	-device ioh3420,id=root_port18,chassis=24,slot=1,bus=pcie.0,addr=18,\
	-device ioh3420,id=root_port19,chassis=25,slot=1,bus=pcie.0,addr=19,\
	-device ioh3420,id=root_port1A,chassis=26,slot=1,bus=pcie.0,addr=1A,\
	-device ioh3420,id=root_port1B,chassis=27,slot=1,bus=pcie.0,addr=1B,\
	-device ioh3420,id=root_port1C,chassis=28,slot=1,bus=pcie.0,addr=1C,\
	-device ioh3420,id=root_port1D,chassis=29,slot=1,bus=pcie.0,addr=1D,\
	-device ioh3420,id=root_port1E,chassis=30,slot=1,bus=pcie.0,addr=1E,\
	-device ioh3420,id=root_port1F,chassis=31,slot=1,bus=pcie.0,addr=1F,\

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

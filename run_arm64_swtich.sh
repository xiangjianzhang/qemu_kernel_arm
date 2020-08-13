qemu-system-aarch64 \
    -kernel ./image/Image \
    -nographic \
    -append "root=/dev/vda console=ttyAMA0 rootfstype=ext4 init=/linuxrc rw" \
    -m 2048M \
    -smp 1  \
    -cpu cortex-a57 \
    -M virt \
    -hda image/rootfs.ext3 \
    \
    -device ioh3420,id=root_port1,chassis=1,slot=5,bus=pcie.0\
    -device x3130-upstream,id=upstream_port0,bus=root_port1\
    -device xio3130-downstream,id=downstream_port0,bus=upstream_port0,chassis=2,slot=0\
    -drive file=./nvme00.raw,if=none,id=D00 -device nvme,bus=downstream_port0,drive=D00,serial=6600 \
    \
    -device xio3130-downstream,id=downstream_port1,bus=upstream_port0,chassis=2,slot=1\
    -drive file=./nvme01.raw,if=none,id=D01 -device nvme,bus=downstream_port1,drive=D01,serial=6601 \
    \
    -device xio3130-downstream,id=downstream_port2,bus=upstream_port0,chassis=2,slot=2\
    -drive file=./nvme02.raw,if=none,id=D02 -device nvme,bus=downstream_port2,drive=D02,serial=6602 \
    \
    -device xio3130-downstream,id=downstream_port3,bus=upstream_port0,chassis=2,slot=3\
    -drive file=./nvme03.raw,if=none,id=D03 -device nvme,bus=downstream_port3,drive=D03,serial=6603 \
    \
    -device xio3130-downstream,id=downstream_port4,bus=upstream_port0,chassis=2,slot=4\
    -drive file=./nvme04.raw,if=none,id=D04 -device nvme,bus=downstream_port4,drive=D04,serial=6604 \
    \
    -device xio3130-downstream,id=downstream_port5,bus=upstream_port0,chassis=2,slot=5\
    -drive file=./nvme05.raw,if=none,id=D05 -device nvme,bus=downstream_port5,drive=D05,serial=6605 \
    \
    -device xio3130-downstream,id=downstream_port6,bus=upstream_port0,chassis=2,slot=6\
    -drive file=./nvme06.raw,if=none,id=D06 -device nvme,bus=downstream_port6,drive=D06,serial=6606 \
    \
    -device xio3130-downstream,id=downstream_port7,bus=upstream_port0,chassis=2,slot=7\
    -drive file=./nvme07.raw,if=none,id=D07 -device nvme,bus=downstream_port7,drive=D07,serial=6607 \
    \
    -device xio3130-downstream,id=downstream_port8,bus=upstream_port0,chassis=2,slot=8\
    -drive file=./nvme08.raw,if=none,id=D08 -device nvme,bus=downstream_port8,drive=D08,serial=6608 \
    \
    -device xio3130-downstream,id=downstream_port9,bus=upstream_port0,chassis=2,slot=9\
    -drive file=./nvme09.raw,if=none,id=D09 -device nvme,bus=downstream_port9,drive=D09,serial=6609 \
    \
    -device xio3130-downstream,id=downstream_port10,bus=upstream_port0,chassis=2,slot=10\
    -drive file=./nvme10.raw,if=none,id=D10 -device nvme,bus=downstream_port10,drive=D10,serial=6610 \
    \
    -device xio3130-downstream,id=downstream_port11,bus=upstream_port0,chassis=2,slot=11\
    -drive file=./nvme11.raw,if=none,id=D11 -device nvme,bus=downstream_port11,drive=D11,serial=6611 \
    \
    -device xio3130-downstream,id=downstream_port12,bus=upstream_port0,chassis=2,slot=12\
    -drive file=./nvme12.raw,if=none,id=D12 -device nvme,bus=downstream_port12,drive=D12,serial=6612 \
    \
    -device xio3130-downstream,id=downstream_port13,bus=upstream_port0,chassis=2,slot=13\
    -drive file=./nvme13.raw,if=none,id=D13 -device nvme,bus=downstream_port13,drive=D13,serial=6613 \
    \
    -device xio3130-downstream,id=downstream_port14,bus=upstream_port0,chassis=2,slot=14\
    -drive file=./nvme14.raw,if=none,id=D14 -device nvme,bus=downstream_port14,drive=D14,serial=6614 \
    \
    -device xio3130-downstream,id=downstream_port15,bus=upstream_port0,chassis=2,slot=15\
    -drive file=./nvme15.raw,if=none,id=D15 -device nvme,bus=downstream_port15,drive=D15,serial=6615 \
    \
    -device xio3130-downstream,id=downstream_port16,bus=upstream_port0,chassis=2,slot=16\
    -drive file=./nvme16.raw,if=none,id=D16 -device nvme,bus=downstream_port16,drive=D16,serial=6616 \
    \
    -device xio3130-downstream,id=downstream_port17,bus=upstream_port0,chassis=2,slot=17\
    -drive file=./nvme17.raw,if=none,id=D17 -device nvme,bus=downstream_port17,drive=D17,serial=6617 \
    \
    -device xio3130-downstream,id=downstream_port18,bus=upstream_port0,chassis=2,slot=18\
    -drive file=./nvme18.raw,if=none,id=D18 -device nvme,bus=downstream_port18,drive=D18,serial=6618 \
    \
    -device xio3130-downstream,id=downstream_port19,bus=upstream_port0,chassis=2,slot=19\
    -drive file=./nvme19.raw,if=none,id=D19 -device nvme,bus=downstream_port19,drive=D19,serial=6619 \
    \
    -device xio3130-downstream,id=downstream_port20,bus=upstream_port0,chassis=2,slot=20\
    -drive file=./nvme20.raw,if=none,id=D20 -device nvme,bus=downstream_port20,drive=D20,serial=6620 \
    \
    -device xio3130-downstream,id=downstream_port21,bus=upstream_port0,chassis=2,slot=21\
    -drive file=./nvme21.raw,if=none,id=D21 -device nvme,bus=downstream_port21,drive=D21,serial=6621 \
    \
    -device xio3130-downstream,id=downstream_port22,bus=upstream_port0,chassis=2,slot=22\
    -drive file=./nvme22.raw,if=none,id=D22 -device nvme,bus=downstream_port22,drive=D22,serial=6622 \
    \
    -device xio3130-downstream,id=downstream_port23,bus=upstream_port0,chassis=2,slot=23\
    -drive file=./nvme23.raw,if=none,id=D23 -device nvme,bus=downstream_port23,drive=D23,serial=6623 \
    \
    -device xio3130-downstream,id=downstream_port24,bus=upstream_port0,chassis=2,slot=24\
    -drive file=./nvme24.raw,if=none,id=D24 -device nvme,bus=downstream_port24,drive=D24,serial=6624 \
    \
    -device xio3130-downstream,id=downstream_port25,bus=upstream_port0,chassis=2,slot=25\
    -drive file=./nvme25.raw,if=none,id=D25 -device nvme,bus=downstream_port25,drive=D25,serial=6625 \
    \
    -device xio3130-downstream,id=downstream_port26,bus=upstream_port0,chassis=2,slot=26\
    -drive file=./nvme26.raw,if=none,id=D26 -device nvme,bus=downstream_port26,drive=D26,serial=6626 \
    \
    -device xio3130-downstream,id=downstream_port27,bus=upstream_port0,chassis=2,slot=27\
    -drive file=./nvme27.raw,if=none,id=D27 -device nvme,bus=downstream_port27,drive=D27,serial=6627 \
    \
    -device xio3130-downstream,id=downstream_port28,bus=upstream_port0,chassis=2,slot=28\
    -drive file=./nvme28.raw,if=none,id=D28 -device nvme,bus=downstream_port28,drive=D28,serial=6628 \
    \
    -device xio3130-downstream,id=downstream_port29,bus=upstream_port0,chassis=2,slot=29\
    -drive file=./nvme29.raw,if=none,id=D29 -device nvme,bus=downstream_port29,drive=D29,serial=6629 \
    \
    -device xio3130-downstream,id=downstream_port30,bus=upstream_port0,chassis=2,slot=30\
    -drive file=./nvme30.raw,if=none,id=D30 -device nvme,bus=downstream_port30,drive=D30,serial=6630 \
    \
    -device xio3130-downstream,id=downstream_port31,bus=upstream_port0,chassis=2,slot=31\
    -drive file=./nvme31.raw,if=none,id=D31 -device nvme,bus=downstream_port31,drive=D31,serial=6631 \
    \

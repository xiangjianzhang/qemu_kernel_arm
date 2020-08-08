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
    -device ioh3420,id=root_port2,chassis=1,slot=1,bus=pcie.0,addr=3\
    -drive file=./nvme29.raw,if=none,id=D29 -device nvme,bus=root_port2,drive=D29,serial=6629 \
    \
    -device ioh3420,id=root_port3,chassis=1,slot=6,bus=pcie.0,addr=6\
    -drive file=./nvme30.raw,if=none,id=D30 -device nvme,bus=root_port3,drive=D30,serial=6630 \
    \
    -device ioh3420,id=root_port1,chassis=1,slot=5,bus=pcie.0,addr=5\
    -device x3130-upstream,id=upstream_port0,bus=root_port1\
    -device xio3130-downstream,id=downstream_port0,bus=upstream_port0,chassis=2,slot=0,addr=0\
    -drive file=./nvme00.raw,if=none,id=D00 -device nvme,bus=downstream_port0,drive=D00,serial=6600 \
    \
    -device xio3130-downstream,id=downstream_port2,bus=upstream_port0,chassis=2,slot=2,addr=2\
    -drive file=./nvme02.raw,if=none,id=D02 -device nvme,bus=downstream_port2,drive=D02,serial=6602 \
    \
    -device xio3130-downstream,id=downstream_port3,bus=upstream_port0,chassis=2,slot=3,addr=3\
    -drive file=./nvme03.raw,if=none,id=D03 -device nvme,bus=downstream_port3,drive=D03,serial=6603 \
    \
    -device xio3130-downstream,id=downstream_port4,bus=upstream_port0,chassis=2,slot=4,addr=4\
    -drive file=./nvme04.raw,if=none,id=D04 -device nvme,bus=downstream_port4,drive=D04,serial=6604 \
    \
    -device xio3130-downstream,id=downstream_port1,bus=upstream_port0,chassis=2,slot=1,addr=1\
    -device x3130-upstream,id=upstream_port1,bus=downstream_port1\
    -device xio3130-downstream,id=downstream_port11,bus=upstream_port1,chassis=3,slot=0,addr=0\
    -drive file=./nvme05.raw,if=none,id=D05 -device nvme,bus=downstream_port11,drive=D05,serial=6605 \
    \
    -device xio3130-downstream,id=downstream_port12,bus=upstream_port1,chassis=3,slot=1,addr=1\
    -drive file=./nvme06.raw,if=none,id=D06 -device nvme,bus=downstream_port12,drive=D06,serial=6606 \
    \
    -device xio3130-downstream,id=downstream_port13,bus=upstream_port1,chassis=3,slot=2,addr=2\
    -drive file=./nvme07.raw,if=none,id=D07 -device nvme,bus=downstream_port13,drive=D07,serial=6607 \
    \
    -device xio3130-downstream,id=downstream_port14,bus=upstream_port1,chassis=3,slot=3,addr=3\
    -device x3130-upstream,id=upstream_port2,bus=downstream_port14\
    -device xio3130-downstream,id=downstream_port20,bus=upstream_port2,chassis=4,slot=0,addr=0\
    -drive file=./nvme08.raw,if=none,id=D08 -device nvme,bus=downstream_port20,drive=D08,serial=6608 \
    \
    -device xio3130-downstream,id=downstream_port21,bus=upstream_port2,chassis=4,slot=1,addr=1\
    -drive file=./nvme09.raw,if=none,id=D09 -device nvme,bus=downstream_port21,drive=D09,serial=6609 \
    \
    -device xio3130-downstream,id=downstream_port22,bus=upstream_port2,chassis=4,slot=2,addr=2\
    -drive file=./nvme10.raw,if=none,id=D10 -device nvme,bus=downstream_port22,drive=D10,serial=6610 \
    \
    -device xio3130-downstream,id=downstream_port23,bus=upstream_port2,chassis=4,slot=3,addr=3\
    -drive file=./nvme11.raw,if=none,id=D11 -device nvme,bus=downstream_port23,drive=D11,serial=6611 \
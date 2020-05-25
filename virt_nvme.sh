qemu-system-aarch64 \
	-kernel ./image/Image \
	-nographic \
	-append "root=/dev/vda console=ttyAMA0 rootfstype=ext4 init=/linuxrc rw" \
	-m 2048M \
	-smp 4  \
	-cpu cortex-a57 \
	-M virt \
	-hda image/a9rootfs.ext3 \
	-drive file=./nvme00.raw,if=none,id=D00 -device nvme,drive=D00,serial=6600 \
	-drive file=./nvme01.raw,if=none,id=D01 -device nvme,drive=D01,serial=6601 \
	-drive file=./nvme02.raw,if=none,id=D02 -device nvme,drive=D02,serial=6602 \
	-drive file=./nvme03.raw,if=none,id=D03 -device nvme,drive=D03,serial=6603 \
	-drive file=./nvme04.raw,if=none,id=D04 -device nvme,drive=D04,serial=6604 \
	-drive file=./nvme05.raw,if=none,id=D05 -device nvme,drive=D05,serial=6605 \
	-drive file=./nvme06.raw,if=none,id=D06 -device nvme,drive=D06,serial=6606 \
	-drive file=./nvme07.raw,if=none,id=D07 -device nvme,drive=D07,serial=6607 \
	-drive file=./nvme08.raw,if=none,id=D08 -device nvme,drive=D08,serial=6608 \
	-drive file=./nvme09.raw,if=none,id=D09 -device nvme,drive=D09,serial=6609 \
	-drive file=./nvme10.raw,if=none,id=D10 -device nvme,drive=D10,serial=6610 \
	-drive file=./nvme11.raw,if=none,id=D11 -device nvme,drive=D11,serial=6611 \
	-drive file=./nvme12.raw,if=none,id=D12 -device nvme,drive=D12,serial=6612 \
	-drive file=./nvme13.raw,if=none,id=D13 -device nvme,drive=D13,serial=6613 \
	-drive file=./nvme14.raw,if=none,id=D14 -device nvme,drive=D14,serial=6614 \
	-drive file=./nvme15.raw,if=none,id=D15 -device nvme,drive=D15,serial=6615 \
	-drive file=./nvme16.raw,if=none,id=D16 -device nvme,drive=D16,serial=6616 \
	-drive file=./nvme17.raw,if=none,id=D17 -device nvme,drive=D17,serial=6617 \
	-drive file=./nvme18.raw,if=none,id=D18 -device nvme,drive=D18,serial=6618 \
	-drive file=./nvme19.raw,if=none,id=D19 -device nvme,drive=D19,serial=6619 \
	-drive file=./nvme20.raw,if=none,id=D20 -device nvme,drive=D20,serial=6620 \
	-drive file=./nvme21.raw,if=none,id=D21 -device nvme,drive=D21,serial=6621 \
	-drive file=./nvme22.raw,if=none,id=D22 -device nvme,drive=D22,serial=6622 \
	-drive file=./nvme23.raw,if=none,id=D23 -device nvme,drive=D23,serial=6623 \
	-drive file=./nvme24.raw,if=none,id=D24 -device nvme,drive=D24,serial=6624 \
	-drive file=./nvme25.raw,if=none,id=D25 -device nvme,drive=D25,serial=6625 \
	-drive file=./nvme26.raw,if=none,id=D26 -device nvme,drive=D26,serial=6626 \
	-drive file=./nvme27.raw,if=none,id=D27 -device nvme,drive=D27,serial=6627 \

#	-drive file=./nvme28.raw,if=none,id=D28 -device nvme,drive=D28,serial=6628 \
#	-drive file=./nvme29.raw,if=none,id=D29 -device nvme,drive=D29,serial=6629 \
#    -drive file=./nvme30.raw,if=none,id=D30 -device nvme,drive=D30,serial=6630 \
#    -drive file=./nvme31.raw,if=none,id=D31 -device nvme,drive=D31,serial=6631 \

# -device virtio-iommu-pci \
#-device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=hostshare \
#-device virtio-iommu-pci-transitional \
#-device virtio-rng-pci-non-transitional \
#-device virtio-rng-pci-non-transitional \
#	-drive file=./nvme00.raw,if=none,id=D00 -device nvme,drive=D00,serial=6600 \
#	-drive file=./nvme01.raw,if=none,id=D01 -device nvme,drive=D01,serial=6601 \
#	-drive file=./nvme02.raw,if=none,id=D02 -device nvme,drive=D02,serial=6602 \
#	-drive file=./nvme03.raw,if=none,id=D03 -device nvme,drive=D03,serial=6603 \
#	-drive file=./nvme04.raw,if=none,id=D04 -device nvme,drive=D04,serial=6604 \
#	-drive file=./nvme05.raw,if=none,id=D05 -device nvme,drive=D05,serial=6605 \
#	-drive file=./nvme06.raw,if=none,id=D06 -device nvme,drive=D06,serial=6606 \
#	-drive file=./nvme07.raw,if=none,id=D07 -device nvme,drive=D07,serial=6607 \
#	-drive file=./nvme08.raw,if=none,id=D08 -device nvme,drive=D08,serial=6608 \
#	-drive file=./nvme09.raw,if=none,id=D09 -device nvme,drive=D09,serial=6609 \
#	-drive file=./nvme10.raw,if=none,id=D10 -device nvme,drive=D10,serial=6610 \
#	-drive file=./nvme11.raw,if=none,id=D11 -device nvme,drive=D11,serial=6611 \
#	-drive file=./nvme12.raw,if=none,id=D12 -device nvme,drive=D12,serial=6612 \
#	-drive file=./nvme13.raw,if=none,id=D13 -device nvme,drive=D13,serial=6613 \
#	-drive file=./nvme14.raw,if=none,id=D14 -device nvme,drive=D14,serial=6614 \
#	-drive file=./nvme15.raw,if=none,id=D15 -device nvme,drive=D15,serial=6615 \
#	-drive file=./nvme16.raw,if=none,id=D16 -device nvme,drive=D16,serial=6616 \
#	-drive file=./nvme17.raw,if=none,id=D17 -device nvme,drive=D17,serial=6617 \
#	-drive file=./nvme18.raw,if=none,id=D18 -device nvme,drive=D18,serial=6618 \
#	-drive file=./nvme19.raw,if=none,id=D19 -device nvme,drive=D19,serial=6619 \
#	-drive file=./nvme20.raw,if=none,id=D20 -device nvme,drive=D20,serial=6620 \
#	-drive file=./nvme21.raw,if=none,id=D21 -device nvme,drive=D21,serial=6621 \
#	-drive file=./nvme22.raw,if=none,id=D22 -device nvme,drive=D22,serial=6622 \
#	-drive file=./nvme23.raw,if=none,id=D23 -device nvme,drive=D23,serial=6623 \
#	-drive file=./nvme24.raw,if=none,id=D24 -device nvme,drive=D24,serial=6624 \
#	-drive file=./nvme25.raw,if=none,id=D25 -device nvme,drive=D25,serial=6625 \
#	-drive file=./nvme26.raw,if=none,id=D26 -device nvme,drive=D26,serial=6626 \
#	-drive file=./nvme27.raw,if=none,id=D27 -device nvme,drive=D27,serial=6627 \
#	-drive file=./nvme28.raw,if=none,id=D28 -device nvme,drive=D28,serial=6628 \
#	-drive file=./nvme29.raw,if=none,id=D29 -device nvme,drive=D29,serial=6629 \
#   -drive file=./nvme30.raw,if=none,id=D30 -device nvme,drive=D30,serial=6630 \
#   -drive file=./nvme31.raw,if=none,id=D31 -device nvme,drive=D31,serial=6631 \

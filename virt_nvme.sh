qemu-system-aarch64 \
	-kernel ./image/Image \
	-nographic \
	-append "root=/dev/vda console=ttyAMA0 rootfstype=ext4 init=/linuxrc rw" \
	-m 2048M \
	-smp 4  \
	-cpu cortex-a57 \
	-M virt \
	-drive file=./nvme.raw,if=none,id=D22 -device nvme,drive=D22,serial=1234 \
	-hda image/a9rootfs.ext3

# -device virtio-iommu-pci \
#-device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=hostshare \
#-device virtio-iommu-pci-transitional \
#-device virtio-rng-pci-non-transitional \
#-device virtio-rng-pci-non-transitional \


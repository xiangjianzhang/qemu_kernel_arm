
KERNEL_DIR := ./kernel_4.19/ 
BUSYBOX_DIR := ./busy_box/
ROOT_DIR := $(shell pwd)

.PHONY: all kernel rootfs config
all: kernel rootfs
	cd $(KERNEL_DIR); cp arch/arm/boot/dts/*.dtb  $(ROOT_DIR)/image/; cp arch/arm/boot/*Image   $(ROOT_DIR)/image/

kernel: 
	cd $(KERNEL_DIR);make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- bzImage -j8
	cd $(KERNEL_DIR);make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- dtbs -j8

rootfs:
	cd $(BUSYBOX_DIR); make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- install -j8
	sudo ./gen_root_fs.sh $(BUSYBOX_DIR)
	cp  a9rootfs.ext3   $(ROOT_DIR)/image/  -av

config:
	cd $(KERNEL_DIR); make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi-  vexpress_defconfig
	cd $(BUSYBOX_DIR); make ARCH=arm qemu_arm_jz_defconfig
	mkdir image -p

run:
	sudo ./run.sh

clean:
	echo "clean"
	cd $(KERNEL_DIR); make clean
	cd $(BUSYBOX_DIR); make clean 
	sudo rm -rf rootfs
	sudo rm -rf tmpfs
	sudo rm -f a9rootfs.ext3
	sudo rm image -fr


KERNEL_DIR := ./kernel_4.19/ 
BUSYBOX_DIR := ./busy_box/
ROOT_DIR := $(shell pwd)
COMPILE = $(shell pwd)/toolchain/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
arch=arm64


.PHONY: all kernel rootfs config
all: kernel rootfs
	cd $(KERNEL_DIR); cp arch/$(arch)/boot/dts/*.dtb  $(ROOT_DIR)/image/; cp arch/$(arch)/boot/*Image   $(ROOT_DIR)/image/

kernel: 
	cd $(KERNEL_DIR);make ARCH=$(arch) CROSS_COMPILE=$(COMPILE) Image -j8 
	cd $(KERNEL_DIR);make ARCH=$(arch) CROSS_COMPILE=$(COMPILE) dtbs -j8

rootfs:
	cd $(BUSYBOX_DIR); make ARCH=$(arch) CROSS_COMPILE=$(COMPILE) install -j8
	sudo ./gen_root_fs.sh $(BUSYBOX_DIR)
	cp  a9rootfs.ext3   $(ROOT_DIR)/image/  -av

config:
	cd $(KERNEL_DIR); make ARCH=$(arch) CROSS_COMPILE=$(COMPILE)  vexpress_$(arch)_defconfig
	cd $(BUSYBOX_DIR); make ARCH=$(arch) qemu_arm_jz_defconfig
	mkdir image -p

run: install
	sudo ./run_$(arch).sh

install:
	cd $(KERNEL_DIR); cp arch/$(arch)/boot/dts/arm/*.dtb  $(ROOT_DIR)/image/; cp arch/$(arch)/boot/*Image   $(ROOT_DIR)/image/
clean:
	echo "clean"
	cd $(KERNEL_DIR); make clean
	cd $(BUSYBOX_DIR); make clean 
	sudo rm -rf rootfs
	sudo rm -rf tmpfs
	sudo rm -f a9rootfs.ext3
	sudo rm image -fr


ROOT_DIR := $(shell pwd)
KERNEL_DIR := $(ROOT_DIR)/kernel_4.19/ 
BUSYBOX_DIR := $(ROOT_DIR)/busy_box/
APP_DIR := $(ROOT_DIR)/nvme/
COMPILE = $(ROOT_DIR)/toolchain/aarch64-linux-gnu/bin/aarch64-linux-gnu-
APP_DRIVER_DIR := $(ROOT_DIR)/nvme/kernel
arch=arm64

.PHONY: all kernel rootfs config
all:  rootfs_build kernel kernel_mod install

kernel: 
	cd $(KERNEL_DIR);make ARCH=$(arch) CROSS_COMPILE=$(COMPILE) Image -j8 
	#cd $(KERNEL_DIR);make ARCH=$(arch) CROSS_COMPILE=$(COMPILE) dtbs -j8
kernel_mod:
	cd $(KERNEL_DIR);make ARCH=$(arch) CROSS_COMPILE=$(COMPILE) modules -j8
	cd $(KERNEL_DIR);make ARCH=$(arch) CROSS_COMPILE=$(COMPILE) modules_install INSTALL_MOD_PATH=../rootfs/ -j8

kernel_menuconfig: 
	cd $(KERNEL_DIR);make ARCH=$(arch) CROSS_COMPILE=$(COMPILE) menuconfig 


rootfs_build:
	cd $(BUSYBOX_DIR); make ARCH=$(arch) CROSS_COMPILE=$(COMPILE) install -j8
	sudo ./gen_root_fs.sh $(BUSYBOX_DIR)
	cp  rootfs.ext3   $(ROOT_DIR)/image/  -av

rootfs_pack:
	rm -fr rootfs.tar.xz
	tar cvf rootfs.tar.xz  rootfs/

rootfs_use_pack:
	rm -fr rootfs
	sudo tar xvf rootfs.tar.xz
rootfs:
	dd if=/dev/zero of=rootfs.ext3 bs=1M count=1024
	mkfs.ext3 rootfs.ext3
	sudo mkdir -p tmpfs
	sudo mount -t ext3 rootfs.ext3 tmpfs/ -o loop
	sudo cp -r rootfs/* tmpfs/
	sudo umount tmpfs
	cp  rootfs.ext3   $(ROOT_DIR)/image/  -av

config:
	cd $(KERNEL_DIR); make ARCH=$(arch) CROSS_COMPILE=$(COMPILE)  nvme_$(arch)_defconfig
	cd $(BUSYBOX_DIR); make ARCH=$(arch) qemu_arm_jz_defconfig
	mkdir image -p
	rm roofs -fr
	#sudo tar xvf rootfs.tar.xz
	./gen_nvme_namespace.sh 

run: 
	sudo ./run_$(arch).sh
gdb: install
	sudo ./run_$(arch)_gdb.sh  
install: rootfs
	#cd $(KERNEL_DIR);cp arch/$(arch)/boot/dts/arm/*.dtb  $(ROOT_DIR)/image/ 
	cd $(KERNEL_DIR);cp arch/$(arch)/boot/*Image   $(ROOT_DIR)/image/

driver_install: 
	cd $(APP_DRIVER_DIR);make ARCH=$(arch)  CROSS_COMPILE=$(COMPILE) KERNELDIR=$(KERNEL_DIR)
	cd $(APP_DRIVER_DIR);make INSTALL_DIR=$(ROOT_DIR)/rootfs/home/   install

clean:
	echo "clean"
	cd $(KERNEL_DIR); make clean
	cd $(BUSYBOX_DIR); make clean 
	sudo rm -rf rootfs
	sudo rm -rf tmpfs
	sudo rm -f rootfs.ext3
	rm *.raw

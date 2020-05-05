
.PHONY: all kernel rootfs config
all: kernel rootfs
	cd ./linux-4.19/; cp arch/arm/boot/dts/*.dtb  ../image/; cp arch/arm/boot/*Image   ../image/

kernel: 
	cd ./linux-4.19/;make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- bzImage -j8

rootfs:
	cd busybox-1.31.1/; make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- install -j8
	cd rootfs; sudo ./gen_root_fs.sh; cp  a9rootfs.ext3   ../image/  -av

config:
	cd ./linux-4.19/;make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi-  vexpress_defconfig

start:
	sudo ./start.sh

clean:
	echo "clean"

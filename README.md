# qemu_kernel_arm
qemu develop envirment for aarch64 linux kernel 4.19

#setup
1. install qemu 
    download qemu code:https://www.qemu.org/download/

    tar xvf qemu-5.0.0-rc3.tar.xz

    mkdir build

    cd build

    ../configure   --target-list=aarch64-softmmu

    make  -j8

    sudo make install

    qemu-system-aarch64  --version

2. get source

    sh get_source.sh

3. intall toolchain
    
    cd ~
    
    git clone https://github.com/xiangjianzhang/arm_tool_chain.git

    cd arm_tool_chain/

    sh install.sh 

    . ~/.bashrc

4. compile and run 

    make config

    make all

    make run

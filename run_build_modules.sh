#!/bin/sh
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules -j8
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules_install INSTALL_MOD_PATH=./kernel_modules


#make modules -j8
#make modules_install INSTALL_MOD_PATH=./kernel_modules


KERNEL_VER=$(make CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 kernelrelease)
[ ! -f "$PWD/kernel_modules/lib/modules/${KERNEL_VER}/modules.dep" ] && depmod -b $PWD/kernel_modules -E Module.symvers -F System.map -w ${KERNEL_VER}
(cd $PWD/kernel_modules && find . -name \*.ko | xargs aarch64-linux-gnu-strip --strip-unneeded)



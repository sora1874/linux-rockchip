#!/bin/bash

DEFAULE_CONFIG=unlasting_defconfig

function build_func {
	if [[ $1 == "clean" ]]
	then
		echo "============ clean source code ============"
		# make mrproper
		make clean
		make disclean
	else
		echo "============ start build ============"
		make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- ${DEFAULE_CONFIG}
		make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- --jobs="$(nproc)" all
	fi
}



########## build ###########
if [[ $2 == "clean" ]]
then
	build_func clean
else
	build_func
fi

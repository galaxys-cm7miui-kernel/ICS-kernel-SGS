#!/bin/sh
export ARCH=arm 
export TOOLCHAIN=~/arm-2011.03
export PATH=$PATH:${TOOLCHAIN}/bin:/usr/java/jdk1.6.0_21/bin
export CROSS_COMPILE=${TOOLCHAIN}/bin/arm-none-eabi-
#export ac_cv_linux_vers=2.6.32
export CC=${TOOLCHAIN}/bin/arm-none-eabi-gcc
export LD=${TOOLCHAIN}/bin/arm-none-eabi-ld
export AR=${TOOLCHAIN}/bin/arm-none-eabi-ar
export RANLIB=${TOOLCHAIN}/arm-none-eabi/bin/ranlib
export PATH=$PATH:${TOOLCHAIN}/bin
export PATH=$PATH:${TOOLCHAIN}/
export PATH=$PATH:${TOOLCHAIN}/lib
export CFLAGS="-mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp -static -Os -fstack-protector -fstack-protector-all -fno-gcse -fprefetch-loop-arrays --param l2-cache-size=512 --param l1-cache-size=64 --param simultaneous-prefetches=6 --param prefetch-latency=400 --param l1-cache-line-size=64"
export LDFLAGS="-static -Os"
export CPPFLAGS="-static -Os"

echo "ARM environment set"

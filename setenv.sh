#!/bin/sh
export ARCH=arm 
export TOOLCHAIN=~/arm-2010q1
export TOOLPREFIX=arm-none-linux-gnueabi
export PATH=$PATH:${TOOLCHAIN}/bin:/usr/java/jdk1.6.0_21/bin
export CROSS_COMPILE=${TOOLCHAIN}/bin/${TOOLPREFIX}-
export CC=${TOOLCHAIN}/bin/${TOOLPREFIX}-gcc
export LD=${TOOLCHAIN}/bin/${TOOLPREFIX}-ld
export AR=${TOOLCHAIN}/bin/${TOOLPREFIX}-ar
export RANLIB=${TOOLCHAIN}/arm-eabi/bin/ranlib
export PATH=$PATH:${TOOLCHAIN}/bin
export PATH=$PATH:${TOOLCHAIN}/
export PATH=$PATH:${TOOLCHAIN}/lib
#export CFLAGS="-mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp -static -Os -fstack-protector -fstack-protector-all -fno-gcse -fprefetch-loop-arrays --param l2-cache-size=512 --param l1-cache-size=64 --param simultaneous-prefetches=6 --param prefetch-latency=400 --param l1-cache-line-size=64 -std=c99"
export CFLAGS="-static -Os -fstack-protector -fstack-protector-all -std=c99"
export LDFLAGS="-static -Os"
export CPPFLAGS="-static -Os"

echo "ARM environment set"

#!/bin/sh

echo "copying config for FASCINATE"
cp arch/arm/configs/fascinatemtd_defconfig .config

echo "building kernel"
make -j8

echo "creating boot.img"
./../../device/samsung/aries-common/mkshbootimg.py release/boot.img arch/arm/boot/zImage ../../../out/target/product/fascinatemtd/ramdisk.img ../../../out/target/product/fascinatemtd/ramdisk-recovery.img

echo "launching packaging script"
./release/doit_fascinate.sh

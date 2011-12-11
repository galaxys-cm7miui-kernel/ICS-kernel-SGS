#!/bin/sh

echo "copying config for TELUS-FASCINATE"
cp arch/arm/configs/aries_telusmtd_defconfig .config

echo "building kernel"
make -j8

echo "creating boot.img"
../../../device/samsung/aries-common/mkshbootimg.py release/boot.img arch/arm/boot/zImage ../../../out/target/product/galaxysmtd/ramdisk.img ../../../out/target/product/galaxysmtd/ramdisk-recovery.img

echo "launching packaging script"
./release/doit-telus.sh

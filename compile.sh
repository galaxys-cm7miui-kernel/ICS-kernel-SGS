#!/bin/sh
. ./setenv.sh

echo "building kernel"
make -j8

echo "creating boot.img"
../../android/system/device/samsung/aries-common/mkshbootimg.py release/boot.img arch/arm/boot/zImage ../../../out/target/product/galaxysmtd/ramdisk.img ../../../out/target/product/galaxysmtd/ramdisk-recovery.img

echo "launching packaging script"
./release/doit.sh

mv release/CM7*.zip ../../public_html/

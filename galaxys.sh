#!/bin/sh

echo "copying config for SGS"
cp arch/arm/configs/aries_galaxysmtd_defconfig .config

echo "building kernel"
make -j8

echo "creating boot.img"
release/build-scripts/mkshbootimg.py release/boot.img arch/arm/boot/zImage release/ramdisks/galaxys_ramdisk/ramdisk.img release/ramdisks/galaxys_ramdisk/ramdisk-recovery.img

echo "launching packaging script"
./release/doit.sh

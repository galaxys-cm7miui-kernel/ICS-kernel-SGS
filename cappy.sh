#!/bin/sh

echo "copying config for CAPPY"
cp arch/arm/configs/aries_captivatemtd_defconfig .config

echo "building kernel"
make -j8

echo "creating boot.img"
release/build-scripts/mkshbootimg.py release/boot.img arch/arm/boot/zImage release/ramdisks/captivate_ramdisk/ramdisk.img release/ramdisks/captivate_ramdisk/ramdisk-recovery.img

echo "launching packaging script"
./release/doit_cappy.sh

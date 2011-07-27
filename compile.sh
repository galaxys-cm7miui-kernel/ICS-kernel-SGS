#!/bin/sh

RELVER=`cat .version`
let RELVER=RELVER+1

. ./setenv.sh

echo "building kernel with voodoo color"
sed -i 's/^.*CONFIG_FB_VOODOO=.*$//' .config
echo 'CONFIG_FB_VOODOO=y
# FB_VOODOO_DEBUG_LOG is not set' >> .config

make -j8

echo "creating boot.img with voodoo color"
../../android/system/device/samsung/aries-common/mkshbootimg.py release/boot.img arch/arm/boot/zImage ../../android/system/out/target/product/galaxysmtd/ramdisk.img ../../android/system/out/target/product/galaxysmtd/ramdisk-recovery.img

echo "launching packaging script with voodoo color"
./release/doit.sh ${RELVER}v

mv release/CM7_FuguMod* ../../public_html/CM7_galaxysmtd

. ./setenv.sh

echo "building kernel without voodoo color"
sed -i 's/^.*CONFIG_FB_VOODOO=.*$//' .config
echo '# CONFIG_FB_VOODOO is not set' >> .config

make -j8

echo "creating boot.img without voodoo color"
../../android/system/device/samsung/aries-common/mkshbootimg.py release/boot.img arch/arm/boot/zImage ../../android/system/out/target/product/galaxysmtd/ramdisk.img ../../android/system/out/target/product/galaxysmtd/ramdisk-recovery.img

echo "launching packaging script without voodoo color"
./release/doit.sh ${RELVER}n

mv release/CM7_FuguMod* ../../public_html/CM7_galaxysmtd

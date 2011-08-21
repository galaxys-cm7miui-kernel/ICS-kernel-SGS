#!/bin/sh

if [ "$1" == "DEBUG" ]; then
	echo '##################### DEBUG VERSION #################'
	sed -i 's/# CONFIG_FRAMEBUFFER_CONSOLE is not set/CONFIG_FRAMEBUFFER_CONSOLE=y/' .config
	sed -i 's/# CONFIG_CMDLINE_FORCE is not set/CONFIG_CMDLINE_FORCE=y/' .config
	DEBUG=1
else
	sed -i 's/CONFIG_FRAMEBUFFER_CONSOLE=y/# CONFIG_FRAMEBUFFER_CONSOLE is not set/' .config
	sed -i 's/CONFIG_CMDLINE_FORCE=y/# CONFIG_CMDLINE_FORCE is not set/' .config
	DEBUG=0
fi

RELVER=`cat .version`
let RELVER=RELVER+1

#ensure there is no more old bcm4329 module
rm drivers/net/wireless/bcm4329/bcm4329.ko drivers/net/wireless/bcmdhd/bcm4329.ko

if [ -f testcompile ]
then
        TEST=test
	echo '************* WARNING, this is a TEST BUILD ***************'
fi

. ./setenv.sh

echo "building kernel with voodoo color"
sed -i 's/^.*FB_VOODOO.*$//' .config
echo 'CONFIG_FB_VOODOO=y
# CONFIG_FB_VOODOO_DEBUG_LOG is not set' >> .config

make -j8

echo "creating boot.img with voodoo color"
../../android/system/device/samsung/aries-common/mkshbootimg.py release/boot.img arch/arm/boot/zImage ../../android/system/out/target/product/galaxysmtd/ramdisk.img ../../android/system/out/target/product/galaxysmtd/ramdisk-recovery.img

echo "launching packaging script with voodoo color"
./release/doit.sh ${RELVER}v

mv release/CM7_FuguMod* ../../public_html/CM7_galaxysmtd/${TEST}/

echo "updating CM7 kernel tree"
cp arch/arm/boot/zImage ~/android/system/device/samsung/galaxysmtd/kernel
cp drivers/net/wireless/bcm4329/bcm4329.ko ~/android/system/device/samsung/galaxysmtd/
cp drivers/net/wireless/bcmdhd/bcm4329.ko ~/android/system/device/samsung/galaxysmtd/
cp drivers/net/tun.ko ~/android/system/device/samsung/galaxysmtd/
cp fs/cifs/cifs.ko ~/android/system/device/samsung/galaxysmtd/

if [ $DEBUG == "0" ]; then 
. ./setenv.sh

echo "building kernel without voodoo color"
sed -i 's/^.*CONFIG_FB_VOODOO=.*$//' .config
echo '# CONFIG_FB_VOODOO is not set' >> .config

make -j8

echo "creating boot.img without voodoo color"
../../android/system/device/samsung/aries-common/mkshbootimg.py release/boot.img arch/arm/boot/zImage ../../android/system/out/target/product/galaxysmtd/ramdisk.img ../../android/system/out/target/product/galaxysmtd/ramdisk-recovery.img

echo "launching packaging script without voodoo color"
./release/doit.sh ${RELVER}n

mv release/CM7_FuguMod* ../../public_html/CM7_galaxysmtd/${TEST}/
fi

#!/bin/sh

echo "cleaning up"
make mrproper
echo "..."

echo "preparing modem driver"
sh prebuilt-drivers.sh
echo "done ..."

echo "building galaxys & telus kernel"
sh galaxys.sh
echo "done ..."


echo "cleaning up"
make mrproper
echo "..."

echo "preparing modem driver"
sh prebuilt-drivers.sh
echo "done"

echo "building captivate kernel"
sh cappy.sh
echo "done ..."

echo "cleaning up"
make mrproper
echo "..."

echo "preparing modem driver"
sh prebuilt-drivers.sh
echo "done ..."

echo "building galaxys & telus kernel"
sh vibrant.sh
echo "done ..."

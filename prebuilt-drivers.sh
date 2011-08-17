#!/bin/sh
echo "changing to modem driver dir"
cd drivers/misc/samsung_modemctl
echo "exec make"
make
echo "moving to modemctl dir"
cd modemctl
echo "exec make"
make
echo "moving back to kernel root dir"
cd ../../../../
echo "done ..."

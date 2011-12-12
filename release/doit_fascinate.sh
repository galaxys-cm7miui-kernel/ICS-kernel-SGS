#!/bin/sh

[[ -d release ]] || {
	echo "must be in kernel root dir"
	exit 1;
}

echo "packaging it up"

TYPE=$1
[[ "$TYPE" == '' ]] && TYPE=FASCINATE

RELVER=$2
[[ "$RELVER" == '' ]] && RELVER="0"

REL=CM7_${TYPE}_$(date +%Y%m%d-%H)_platypus.zip

rm -r release/system 2> /dev/null
mkdir  -p release/system/lib/modules || exit 1
mkdir  -p release/system/etc/init.d || exit 1
#cp release/logger.module release/system/lib/modules/logger.ko
find . -name "*.ko" -exec cp {} release/system/lib/modules/ \; 2>/dev/null || exit 1

cd release && {
	cp 91logger system/etc/init.d/ || exit 1
	mkdir -p system/bin
	cp bin/* system/bin/
	zip -q -r ${REL} system boot.img META-INF bml_over_mtd bml_over_mtd.sh || exit 1
	sha256sum ${REL} > ${REL}.sha256sum
	rm -rf ${TYPE} || exit 1
	mkdir -p ${TYPE} || exit 1
	mv ${REL}* ${TYPE} || exit 1
} || exit 1

echo ${REL}
rm system/lib/modules/*
rm system/etc/init.d/*
exit 0

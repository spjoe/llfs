#!/bin/sh

export MKLLFS=/root/e2fsprogs-1.41.0.llfs/build/misc/mkllfs
export LLFS_DEVICE=/dev/hdb1
MOUNT_OPTIONS=

getdir() {
	echo "/llfs$1"
}
lmount() {
	mount -t llfs $LLFS_DEVICE `getdir $1` $MOUNT_OPTIONS
}
lmountro() {
	mount -t llfs $LLFS_DEVICE `getdir $1` -o ro
}
lumount() {
	umount `getdir $1`
}
llfsclone(){
	echo $1$2 > `getdir $1`/.config
	sync
}

rm -R results
mkdir results
comp=0
fail=0

source ./simpletest.sh
source ./test1.sh
source ./test2.sh
source ./test3.sh
source ./test4.sh
source ./test5.sh


echo "Von $comp Test Cases sind $fail fehlgeschlagen"


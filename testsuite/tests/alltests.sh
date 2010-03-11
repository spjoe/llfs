#!/bin/sh

export MKLLFS=../e2fsprogs-1.41.0.llfs/build/misc/mkllfs

getdir() {
	echo "/llfs$1"
}
lmount() {
	mount -t llfs /dev/hdb1 `getdir $1`
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
#export comp
#export fail

#source ./simpletest.sh
source ./test1.sh
#source ./test2.sh
#source ./test3.sh

echo "Von $comp Test Cases sind $fail fehlgeschlagen"



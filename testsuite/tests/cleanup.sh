#!/bin/sh
echo "REMOVE llfs module..."
modprobe -r llfs
echo "LOAD llfs module..."
modprobe llfs
echo "CLEANUP THE SYSTEM"
../e2fsprogs-1.41.0.llfs/build/misc/mkllfs /dev/hdb1 > /dev/null

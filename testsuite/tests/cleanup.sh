#!/bin/sh
echo "REMOVE llfs module..."
modprobe -r llfs
echo "LOAD llfs module..."
modprobe llfs
echo "CLEANUP THE SYSTEM"
$MKLLFS $LLFS_DEVICE > /dev/null

#!/bin/sh
echo "REMOVE llfs module..."
modprobe -r llfs
echo "LOAD llfs module..."
modprobe llfs
echo "CLEANUP THE SYSTEM"
$MKLLFS /dev/hdb1 > /dev/null

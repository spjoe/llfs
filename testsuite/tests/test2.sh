#!/bin/sh
# Test 2 is all about directory creation
./cleanup.sh
mount -t llfs /dev/hdb1 /llfs0
mkdir /llfs0/Clone0Step1
mkdir /llfs0/Clone0Step2

echo 01 > /llfs0/.config
sync
echo 02 > /llfs0/.config
sync

umount /llfs0
mount -t llfs /dev/hdb1 /llfs1
mkdir /llfs1/Clone1Step3
umount /llfs1
mount -t llfs /dev/hdb1 /llfs2
mkdir /llfs2/Clone2Step4
umount /llfs2

mount -t llfs /dev/hdb1 /llfs0
mount -t llfs /dev/hdb1 /llfs1
mount -t llfs /dev/hdb1 /llfs2

ls /llfs0 -1
ls /llfs1 -1
ls /llfs2 -1

umount /llfs0
umount /llfs1
umount /llfs2

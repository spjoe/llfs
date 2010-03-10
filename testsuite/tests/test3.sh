#!/bin/sh
#Test 3 is all about file adding
./cleanup.sh
mount -t llfs /dev/hdb1 /llfs0
touch /llfs0/test
echo "Geschrieben von Clone0" > /llfs0/test

echo 01 > /llfs0/.config
sync
echo 02 > /llfs0/.config
sync

umount /llfs0
mount -t llfs /dev/hdb1 /llfs1
echo "Added by Clone1" >> /llfs1/test
umount /llfs1
mount -t llfs /dev/hdb1 /llfs2
echo "Added by Clone2" >> /llfs2/test
umount /llfs2

mount -t llfs /dev/hdb1 /llfs0
mount -t llfs /dev/hdb1 /llfs1
mount -t llfs /dev/hdb1 /llfs2

cat /llfs0/test
cat /llfs1/test
cat /llfs2/test

umount /llfs0
umount /llfs1
umount /llfs2

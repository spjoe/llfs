#!/bin/sh
# Test 1 is all about file creation

echo "Startet des 1. Test, \nhier testen wir die Erstellung von Datein"
echo "================================================================================"
echo "Erster Test Case Clone 1 von Clone 0, Clone 2 von Clone 1"
echo "================================================================================"

./cleanup.sh
mount -t llfs /dev/hdb1 /llfs0
touch /llfs0/Clone0Step1
touch /llfs0/Clone0Step2

echo 01 > /llfs0/.config
sync


umount /llfs0
mount -t llfs /dev/hdb1 /llfs1
touch /llfs1/Clone1Step3
echo 12 > /llfs1/.config
sync
umount /llfs1


mount -t llfs /dev/hdb1 /llfs2
touch /llfs2/Clone2Step4
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

echo "================================================================================"
echo "Zweiter Test Case Clone 1 und 2 von Clone 0"
echo "================================================================================"

./cleanup.sh
mount -t llfs /dev/hdb1 /llfs0
touch /llfs0/Clone0Step1
touch /llfs0/Clone0Step2

echo 01 > /llfs0/.config
sync
echo 02 > /llfs0/.config
sync

umount /llfs0
mount -t llfs /dev/hdb1 /llfs1
touch /llfs1/Clone1Step3
umount /llfs1
mount -t llfs /dev/hdb1 /llfs2
touch /llfs2/Clone2Step4
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

echo "================================================================================"
echo "Dritter Test Case Clone 1 von Clone 0"
echo "================================================================================"

./cleanup.sh
mount -t llfs /dev/hdb1 /llfs0
touch /llfs0/Clone0Step1

echo 01 > /llfs0/.config
sync

umount /llfs0
mount -t llfs /dev/hdb1 /llfs1
touch /llfs1/Clone1Step2
umount /llfs1

mount -t llfs /dev/hdb1 /llfs0
mount -t llfs /dev/hdb1 /llfs1

ls /llfs0 -1
ls /llfs1 -1

umount /llfs0
umount /llfs1

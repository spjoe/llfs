#!/bin/sh
# Test 2 is all about directory creation
echo "Start des 2. Test, hier testen wir die Erstellung von Verzeichnissen"
echo "================================================================================"
echo "Erster Test Case Clone 1 und 2 von Clone 0"
echo "================================================================================"

./cleanup.sh
./mount.sh 0
mkdir /llfs0/Clone0Step1
mkdir /llfs0/Clone0Step2

./llfs-clone.sh 0 1
./llfs-clone.sh 0 2

umount /llfs0
./mount.sh 1
mkdir /llfs1/Clone1Step3
umount /llfs1
./mount.sh 2
mkdir /llfs2/Clone2Step4
umount /llfs2

./mount.sh 0
./mount.sh 1
./mount.sh 2

check=0
if ls /llfs0 -1 | diff - expected/expect2.1.1 > results/diff.2.1.1;
	then true
	else check=1; echo "2.1.1 fehlgeschlagen"
fi
if ls /llfs1 -1 | diff - expected/expect2.1.2 > results/diff.2.1.2;
	then true
	else check=1; echo "2.1.2 fehlgeschlagen"
fi
if ls /llfs2 -1 | diff - expected/expect2.1.3 > results/diff.2.1.3;
	then true
	else check=1; echo "2.1.3 fehlgeschlagen"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`

if [ $check -eq 1 ]
	then echo "Im Test 2 Case 1 sind Fehler aufgetreten"
fi

umount /llfs0
umount /llfs1
umount /llfs2

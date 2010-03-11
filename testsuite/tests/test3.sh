#!/bin/sh
#Test 3 is all about file adding
echo "Start des 3. Test, hier testen wir die Änderungen von Datein"
echo "================================================================================"
echo "Erster Test Case Clone 1 und 2 von Clone 0"
echo "================================================================================"


./cleanup.sh
./mount.sh 0
touch /llfs0/test
echo "Geschrieben von Clone0" > /llfs0/test

./llfs-clone.sh 0 1
./llfs-clone.sh 0 2

umount /llfs0
./mount.sh 1
echo "Added by Clone1" >> /llfs1/test
umount /llfs1
./mount.sh 2
echo "Added by Clone2" >> /llfs2/test
umount /llfs2

./mount.sh 0
./mount.sh 1
./mount.sh 2

check=0
if diff /llfs0/test expected/expect3.1.1 > results/diff.3.1.1;
	then true
	else check=1; echo "3.1.1 fehlgeschlagen"
fi
if diff /llfs1/test expected/expect3.1.2 > results/diff.3.1.2;
	then true
	else check=1; echo "3.1.2 fehlgeschlagen"
fi
if diff /llfs2/test expected/expect3.1.3 > results/diff.3.1.3;
	then true
	else check=1; echo "3.1.3 fehlgeschlagen"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`

if [ $check -eq 1 ]
	then echo "Im Test 3 Case 1 sind Fehler aufgetreten"
fi

umount /llfs0
umount /llfs1
umount /llfs2

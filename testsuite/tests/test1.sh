#!/bin/sh
# Test 1 is all about file creation

echo "Start des 1. Test, hier testen wir die Erstellung von Datein"
echo "================================================================================"
echo "Erster Test Case Clone 1 von Clone 0, Clone 2 von Clone 1"
echo "================================================================================"

./cleanup.sh
./mount.sh 0
touch /llfs0/Clone0Step1
touch /llfs0/Clone0Step2

./llfs-clone.sh 0 1


umount /llfs0
./mount.sh 1
touch /llfs1/Clone1Step3
./llfs-clone.sh 2 1
umount /llfs1


./mount.sh 2
touch /llfs2/Clone2Step4
umount /llfs2

./mount.sh 0
./mount.sh 1
./mount.sh 2

check=0
if ls /llfs0 -1 | diff - expected/expect1.1.1 > results/diff.1.1.1;
	then true
	else check=1; echo "1.1.1 fehlgeschlagen"
fi
if ls /llfs1 -1 | diff - expected/expect1.1.2 > results/diff.1.1.2;
	then true
	else check=1; echo "1.1.2 fehlgeschlagen"
fi
if ls /llfs2 -1 | diff - expected/expect1.1.3 > results/diff.1.1.3;
	then true
	else check=1; echo "1.1.3 fehlgeschlagen"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`

if [ $check -eq 1 ]
	then echo "Im Test 1 Case 1 sind Fehler aufgetreten"
fi

umount /llfs0
umount /llfs1
umount /llfs2



echo "================================================================================"
echo "Zweiter Test Case Clone 1 und 2 von Clone 0"
echo "================================================================================"

./cleanup.sh
./mount.sh 0
touch /llfs0/Clone0Step1
touch /llfs0/Clone0Step2

./llfs-clone.sh 0 1
./llfs-clone.sh 0 2

umount /llfs0
./mount.sh 1
touch /llfs1/Clone1Step3
umount /llfs1
./mount.sh 2
touch /llfs2/Clone2Step4
umount /llfs2

./mount.sh 0
./mount.sh 1
./mount.sh 2

check=0
if ls /llfs0 -1 | diff - expected/expect1.2.1 > results/diff.1.2.1;
	then true
	else check=1; echo "1.2.1 fehlgeschlagen"
fi
if ls /llfs1 -1 | diff - expected/expect1.2.2 > results/diff.1.2.2;
	then true
	else check=1; echo "1.2.2 fehlgeschlagen"
fi
if ls /llfs2 -1 | diff - expected/expect1.2.3 > results/diff.1.2.3;
	then true
	else check=1; echo "1.2.3 fehlgeschlagen"
fi
touch /llfs0/Clone0Step5
if ls /llfs0 -1 | diff - expected/expect1.2.4 > results/diff.1.2.4;
	then true
	else check=1; echo "1.2.4 fehlgeschlagen"
fi
if ls /llfs1 -1 | diff - expected/expect1.2.5 > results/diff.1.2.5;
	then true
	else check=1; echo "1.2.5 fehlgeschlagen"
fi
if ls /llfs2 -1 | diff - expected/expect1.2.6 > results/diff.1.2.6;
	then true
	else check=1; echo "1.2.6 fehlgeschlagen"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`

if [ $check -eq 1 ]
	then echo "Im Test 1 Case 2 sind Fehler aufgetreten"
fi

umount /llfs0
umount /llfs1
umount /llfs2

echo "================================================================================"
echo "Dritter Test Case Clone 1 von Clone 0"
echo "================================================================================"

./cleanup.sh
./mount.sh 0
touch /llfs0/Clone0Step1

./llfs-clone.sh 0 1

umount /llfs0
./mount.sh 1
touch /llfs1/Clone1Step2
umount /llfs1

./mount.sh 0
./mount.sh 1

check=0
if ls /llfs0 -1 | diff - expected/expect1.3.1 > results/diff.1.3.1;
	then true
	else check=1; echo "1.3.1 fehlgeschlagen"
fi
if ls /llfs1 -1 | diff - expected/expect1.3.2 > results/diff.1.3.2;
	then true
	else check=1; echo "1.3.2 fehlgeschlagen"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`

if [ $check -eq 1 ]
	then echo "Im Test 1 Case 3 sind Fehler aufgetreten"
fi

umount /llfs0
umount /llfs1

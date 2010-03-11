#!/bin/sh
# Test 2 is all about directory creation
echo "Start des 2. Test, hier testen wir die Erstellung von Verzeichnissen"
echo "================================================================================"
echo "Erster Test Case Clone 1 und 2 von Clone 0"
echo "================================================================================"

./cleanup.sh
lmount 0
mkdir `getdir 0`/Clone0Step1
mkdir `getdir 0`/Clone0Step2

./llfs-clone.sh 0 1
./llfs-clone.sh 0 2

lumount 0
lmount 1
mkdir `getdir 1`/Clone1Step3
lumount 1
lmount 2
mkdir `getdir 2`/Clone2Step4
lumount 2

lmount 0
lmount 1
lmount 2

check=0
if ls `getdir 0` -1 | diff - expected/expect2.1.1 > results/diff.2.1.1;
	then true
	else check=1; echo "2.1.1 fehlgeschlagen"
fi
if ls `getdir 1` -1 | diff - expected/expect2.1.2 > results/diff.2.1.2;
	then true
	else check=1; echo "2.1.2 fehlgeschlagen"
fi
if ls `getdir 2` -1 | diff - expected/expect2.1.3 > results/diff.2.1.3;
	then true
	else check=1; echo "2.1.3 fehlgeschlagen"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`

if [ $check -eq 1 ]
	then echo "Im Test 2 Case 1 sind Fehler aufgetreten"
fi

lumount 0
lumount 1
lumount 2

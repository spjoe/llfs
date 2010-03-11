#!/bin/sh
#Test 3 is all about file adding
echo "Start des 3. Test, hier testen wir die Änderungen von Datein"
echo "================================================================================"
echo "Erster Test Case Clone 1 und 2 von Clone 0"
echo "================================================================================"


./cleanup.sh
lmount 0
touch `getdir 0`/test
echo "Geschrieben von Clone0" > `getdir 0`/test

./llfs-clone.sh 0 1
./llfs-clone.sh 0 2

lumount 0
lmount 1
echo "Added by Clone1" >> `getdir 1`/test
lumount 1
lmount 2
echo "Added by Clone2" >> `getdir 2`/test
lumount 2

lmount 0
lmount 1
lmount 2

check=0
if diff `getdir 0`/test expected/expect3.1.1 > results/diff.3.1.1;
	then true
	else check=1; echo "3.1.1 fehlgeschlagen"
fi
if diff `getdir 1`/test expected/expect3.1.2 > results/diff.3.1.2;
	then true
	else check=1; echo "3.1.2 fehlgeschlagen"
fi
if diff `getdir 2`/test expected/expect3.1.3 > results/diff.3.1.3;
	then true
	else check=1; echo "3.1.3 fehlgeschlagen"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`

if [ $check -eq 1 ]
	then echo "Im Test 3 Case 1 sind Fehler aufgetreten"
fi

lumount 0
lumount 1
lumount 2

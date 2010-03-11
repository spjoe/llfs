echo "================================================================================"
echo "================================================================================"
echo "Start des 4. Test, hier testen wir das Löschen von Dateien"
echo "================================================================================"
echo "Erster Test Case Clone 1 und , Clone 2 von Clone 1"
echo "================================================================================"

./cleanup.sh
lmount 0
touch `getdir 0`/Clone0Step1
touch `getdir 0`/Clone0Step2
touch `getdir 0`/Clone0Step3

llfsclone 0 1
llfsclone 0 2

lumount 0

lmount 0
lmount 1
lmount 2

check=0
if ls `getdir 0` -1 | diff - expected/expect4.1.1 > results/diff.4.1.1;
	then true
	else check=1; echo "4.1.1 fehlgeschlagen"
fi
if ls `getdir 1` -1 | diff - expected/expect4.1.2 > results/diff.4.1.2;
	then true
	else check=1; echo "4.1.2 fehlgeschlagen"
fi
if ls `getdir 2` -1 | diff - expected/expect4.1.3 > results/diff.4.1.3;
	then true
	else check=1; echo "4.1.3 fehlgeschlagen"
fi

rm `getdir 0`/Clone0Step1
rm `getdir 1`/Clone0Step2
rm `getdir 2`/Clone0Step3

if ls `getdir 0` -1 | diff - expected/expect4.1.4 > results/diff.4.1.4;
	then true
	else check=1; echo "4.1.4 fehlgeschlagen"
fi
if ls `getdir 1` -1 | diff - expected/expect4.1.5 > results/diff.4.1.5;
	then true
	else check=1; echo "4.1.5 fehlgeschlagen"
fi
if ls `getdir 2` -1 | diff - expected/expect4.1.6 > results/diff.4.1.6;
	then true
	else check=1; echo "4.1.6 fehlgeschlagen"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`

if [ $check -eq 1 ]
	then echo "Im Test 4 Case 1 sind Fehler aufgetreten"
fi

lumount 0
lumount 1
lumount 2



echo "Start des Simple Tests, erzeugen löschen, ändern und umbenennen ohne cloning"
echo "================================================================================"
echo "Erster Test Erzeugen"
echo "================================================================================"

./cleanup.sh
./mount.sh 0
touch /llfs0/Step1
mkdir /llfs0/Step2

umount /llfs0

./mount.sh 0

check=0
if ls /llfs0 | diff - expected/expectsimple.1.1 > results/diff.simple.1.1;
	then true
	else check=1; echo "simple.1.1 fehlgeschlagen"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`

if [ $check -eq 1 ]
	then echo "Im Test Simple Case 1 sind Fehler aufgetreten"
fi

umount /llfs0

echo "================================================================================"
echo "Zweiter Test Löschen"
echo "================================================================================"

./cleanup.sh
./mount.sh 0
touch /llfs0/Step1
touch /llfs0/Step2
mkdir /llfs0/Step3
mkdir /llfs0/Step4

umount /llfs0

./mount.sh 0

check=0
if ls /llfs0 -1 | diff - expected/expectsimple.2.1 > results/diff.simple.2.1;
	then true
	else check=1; echo "simple.2.1 fehlgeschlagen"
fi



rm -R /llfs0/Step4
rm /llfs0/Step1

umount /llfs0

./mount.sh 0

if ls /llfs0 -1 | diff - expected/expectsimple.2.2 > results/diff.simple.2.2;
	then true
	else check=1; echo "simple.2.2 fehlgeschlagen"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`
if [ $check -eq 1 ]
	then echo "Im Test Simple Case 2 sind Fehler aufgetreten"
fi

umount /llfs0

echo "================================================================================"
echo "Dritter Test Ändern"
echo "================================================================================"

./cleanup.sh
./mount.sh 0
touch /llfs0/Step1
echo "Step1 Text" > /llfs0/Step1

umount /llfs0

./mount.sh 0

check=0
if diff /llfs0/Step1 expected/expectsimple.3.1 > results/diff.simple.3.1;
	then true
	else check=1; echo "simple.3.1 fehlgeschlagen"
fi

echo "Step2 Text" > /llfs0/Step1

umount /llfs0

./mount.sh 0

if diff /llfs0/Step1 expected/expectsimple.3.2 > results/diff.simple.3.2;
	then true
	else check=1; echo "simple.3.2 fehlgeschlagen"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`
if [ $check -eq 1 ]
	then echo "Im Test Simple Case 3 sind Fehler aufgetreten"
fi

umount /llfs0

echo "================================================================================"
echo "Vierter Test Umbenennen"
echo "================================================================================"

./cleanup.sh
./mount.sh 0
touch /llfs0/Step1
mkdir /llfs0/Step2

umount /llfs0

./mount.sh 0

check=0
if ls /llfs0 -1 | diff - expected/expectsimple.4.1 > results/diff.simple.4.1;
	then true
	else check=1; echo "simple.4.1 fehlgeschlagen"
fi

mv /llfs0/Step1 /llfs0/Step1Changed
mv /llfs0/Step2 /llfs0/Step2Changed

umount /llfs0

./mount.sh 0

if ls /llfs0 -1 | diff - expected/expectsimple.4.2 > results/diff.simple.4.2;
	then true
	else check=1; echo "simple.4.2 fehlgeschlagen"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`
if [ $check -eq 1 ]
	then echo "Im Test Simple Case 4 sind Fehler aufgetreten"
fi

umount /llfs0

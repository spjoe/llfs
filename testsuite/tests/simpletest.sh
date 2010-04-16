echo "================================================================================"
echo "================================================================================"
echo "Start the simple Tests: testing creation, deletion, move without cloning"
echo "================================================================================"
echo "First test creation"
echo "================================================================================"

./cleanup.sh
lmount 0
touch `getdir 0`/Step1
mkdir `getdir 0`/Step2

lumount 0

lmount 0

check=0
if ls `getdir 0` | diff - expected/expectsimple.1.1 > results/diff.simple.1.1;
	then true
	else check=1; echo "simple.1.1 failed"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`

if [ $check -eq 1 ]
	then echo "1. simple test failed"
fi

lumount 0

echo "================================================================================"
echo "Second test deletion"
echo "================================================================================"

./cleanup.sh
lmount 0
touch `getdir 0`/Step1
touch `getdir 0`/Step2
mkdir `getdir 0`/Step3
mkdir `getdir 0`/Step4

lumount 0

lmount 0

check=0
if ls `getdir 0` -1 | diff - expected/expectsimple.2.1 > results/diff.simple.2.1;
	then true
	else check=1; echo "simple.2.1 failed"
fi



rm -R `getdir 0`/Step4
rm `getdir 0`/Step1

lumount 0

lmount 0

if ls `getdir 0` -1 | diff - expected/expectsimple.2.2 > results/diff.simple.2.2;
	then true
	else check=1; echo "simple.2.2 failed"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`
if [ $check -eq 1 ]
	then echo "2. simple test failed"
fi

lumount 0

echo "================================================================================"
echo "Third test change"
echo "================================================================================"

./cleanup.sh
lmount 0
touch `getdir 0`/Step1
echo "Step1 Text" > `getdir 0`/Step1

lumount 0

lmount 0

check=0
if diff `getdir 0`/Step1 expected/expectsimple.3.1 > results/diff.simple.3.1;
	then true
	else check=1; echo "simple.3.1 failed"
fi

echo "Step2 Text" > `getdir 0`/Step1

lumount 0

lmount 0

if diff `getdir 0`/Step1 expected/expectsimple.3.2 > results/diff.simple.3.2;
	then true
	else check=1; echo "simple.3.2 failed"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`
if [ $check -eq 1 ]
	then echo "3. simple test failed"
fi

lumount 0

echo "================================================================================"
echo "Fourth test move"
echo "================================================================================"

./cleanup.sh
lmount 0
touch `getdir 0`/Step1
mkdir `getdir 0`/Step2

lumount 0

lmount 0

check=0
if ls `getdir 0` -1 | diff - expected/expectsimple.4.1 > results/diff.simple.4.1;
	then true
	else check=1; echo "simple.4.1 failed"
fi

mv `getdir 0`/Step1 `getdir 0`/Step1Changed
mv `getdir 0`/Step2 `getdir 0`/Step2Changed

lumount 0

lmount 0

if ls `getdir 0` -1 | diff - expected/expectsimple.4.2 > results/diff.simple.4.2;
	then true
	else check=1; echo "simple.4.2 failed"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`
if [ $check -eq 1 ]
	then echo "4. simple test failed"
fi

lumount 0

echo "================================================================================"
echo "================================================================================"
echo "Start the 1. test: testing file creation"
echo "================================================================================"
echo "First test case Clone 1 from Clone 0, Clone 2 from Clone 1"
echo "================================================================================"

./cleanup.sh
lmount 0
touch `getdir 0`/Clone0Step1
touch `getdir 0`/Clone0Step2

llfsclone 0 1


lumount 0
lmount 1
touch `getdir 1`/Clone1Step3
llfsclone 1 2
lumount 1


lmount 2
touch `getdir 2`/Clone2Step4
lumount 2

lmount 0
lmount 1
lmount 2

check=0
if ls `getdir 0` -1 | diff - expected/expect1.1.1 > results/diff.1.1.1;
	then true
	else check=1; echo "1.1.1 failed"
fi
if ls `getdir 1` -1 | diff - expected/expect1.1.2 > results/diff.1.1.2;
	then true
	else check=1; echo "1.1.2 failed"
fi
if ls `getdir 2` -1 | diff - expected/expect1.1.3 > results/diff.1.1.3;
	then true
	else check=1; echo "1.1.3 failed"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`

if [ $check -eq 1 ]
	then echo "Test 1.1 failed"
fi

lumount 0
lumount 1
lumount 2



echo "================================================================================"
echo "Second test case Clone 1 and 2 from Clone 0"
echo "================================================================================"

./cleanup.sh
lmount 0
touch `getdir 0`/Clone0Step1
touch `getdir 0`/Clone0Step2

llfsclone 0 1
llfsclone 0 2

lumount 0
lmount 1
touch `getdir 1`/Clone1Step3
lumount 1
lmount 2
touch `getdir 2`/Clone2Step4
lumount 2

lmount 0
lmount 1
lmount 2

check=0
if ls `getdir 0` -1 | diff - expected/expect1.2.1 > results/diff.1.2.1;
	then true
	else check=1; echo "1.2.1 failed"
fi
if ls `getdir 1` -1 | diff - expected/expect1.2.2 > results/diff.1.2.2;
	then true
	else check=1; echo "1.2.2 failed"
fi
if ls `getdir 2` -1 | diff - expected/expect1.2.3 > results/diff.1.2.3;
	then true
	else check=1; echo "1.2.3 failed"
fi
touch `getdir 0`/Clone0Step5
if ls `getdir 0` -1 | diff - expected/expect1.2.4 > results/diff.1.2.4;
	then true
	else check=1; echo "1.2.4 failed"
fi
if ls `getdir 1` -1 | diff - expected/expect1.2.5 > results/diff.1.2.5;
	then true
	else check=1; echo "1.2.5 failed"
fi
if ls `getdir 2` -1 | diff - expected/expect1.2.6 > results/diff.1.2.6;
	then true
	else check=1; echo "1.2.6 failed"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`

if [ $check -eq 1 ]
	then echo "Test 1.2 failed"
fi

lumount 0
lumount 1
lumount 2

echo "================================================================================"
echo "Third test case Clone 1 from Clone 0"
echo "================================================================================"

./cleanup.sh
lmount 0
touch `getdir 0`/Clone0Step1

llfsclone 0 1

lumount 0
lmount 1
touch `getdir 1`/Clone1Step2
lumount 1

lmount 0
lmount 1

check=0
if ls `getdir 0` -1 | diff - expected/expect1.3.1 > results/diff.1.3.1;
	then true
	else check=1; echo "1.3.1 failed"
fi
if ls `getdir 1` -1 | diff - expected/expect1.3.2 > results/diff.1.3.2;
	then true
	else check=1; echo "1.3.2 failed"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`

if [ $check -eq 1 ]
	then echo "Test 1.3 failed"
fi

lumount 0
lumount 1

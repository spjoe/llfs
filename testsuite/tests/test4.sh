echo "================================================================================"
echo "================================================================================"
echo "Start 4. Test: testing file deletion"
echo "================================================================================"
echo "First test case Clone 1 and Clone 2 from Clone 0"
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
	else check=1; echo "4.1.1 failed"
fi
if ls `getdir 1` -1 | diff - expected/expect4.1.2 > results/diff.4.1.2;
	then true
	else check=1; echo "4.1.2 failed"
fi
if ls `getdir 2` -1 | diff - expected/expect4.1.3 > results/diff.4.1.3;
	then true
	else check=1; echo "4.1.3 failed"
fi

rm `getdir 0`/Clone0Step1
rm `getdir 1`/Clone0Step2
rm `getdir 2`/Clone0Step3

if ls `getdir 0` -1 | diff - expected/expect4.1.4 > results/diff.4.1.4;
	then true
	else check=1; echo "4.1.4 failed"
fi
if ls `getdir 1` -1 | diff - expected/expect4.1.5 > results/diff.4.1.5;
	then true
	else check=1; echo "4.1.5 failed"
fi
if ls `getdir 2` -1 | diff - expected/expect4.1.6 > results/diff.4.1.6;
	then true
	else check=1; echo "4.1.6 failed"
fi

comp=`expr $comp + 1`
fail=`expr $fail + $check`

if [ $check -eq 1 ]
	then echo "Test 4.1 failed"
fi

lumount 0
lumount 1
lumount 2


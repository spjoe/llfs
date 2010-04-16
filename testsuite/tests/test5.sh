echo "================================================================================"
echo "================================================================================"
echo "Start 5. Test: testing snapshots (read-only clones)"
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


check=0
if ls `getdir 0` -1 | diff - expected/expect5.1.1 > results/diff.5.1.1;
	then true
	else check=1; echo "5.1.1 failed"
fi
lumount 0
lmountro 1
if ls `getdir 1` -1 | diff - expected/expect5.1.2 > results/diff.5.1.2;
	then true
	else check=1; echo "5.1.2 failed"
fi
lumount 1
lmountro 2
if ls `getdir 2` -1 | diff - expected/expect5.1.3 > results/diff.5.1.3;
	then true
	else check=1; echo "5.1.3 failed"
fi
lumount 2
lmount 0
rm `getdir 0`/Clone0Step1

if ls `getdir 0` -1 | diff - expected/expect5.1.4 > results/diff.5.1.4;
	then true
	else check=1; echo "5.1.4 failed"
fi
lumount 0
lmountro 1
if ls `getdir 1` -1 | diff - expected/expect5.1.5 > results/diff.5.1.5;
	then true
	else check=1; echo "5.1.5 failed"
fi
lumount 1
lmountro 2
if ls `getdir 2` -1 | diff - expected/expect5.1.6 > results/diff.5.1.6;
	then true
	else check=1; echo "5.1.6 failed"
fi
lumount 2
comp=`expr $comp + 1`
fail=`expr $fail + $check`

if [ $check -eq 1 ]
	then echo "Test 5.1 failed"
fi



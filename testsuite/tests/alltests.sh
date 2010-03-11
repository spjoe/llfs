#!/bin/sh

export MKLLFS=../e2fsprogs-1.41.0.llfs/build/misc/mkllfs


rm -R results
mkdir results
comp=0
fail=0
#export comp
#export fail

source ./test1.sh
source ./test2.sh
source ./test3.sh

echo "Von $comp Test Cases sind $fail fehlgeschlagen"



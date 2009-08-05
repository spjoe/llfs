#!/bin/sh

grep -ril CONFIG_EXT2 ../llfs/* | while read file; do sed 's/CONFIG_EXT2/CONFIG_LLFS/g' $file >$file.tmp && mv "$file.tmp" "$file"; done

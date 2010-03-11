#!/bin/sh

echo $1$2 > /llfs$1/.config
sync

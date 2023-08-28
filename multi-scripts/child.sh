#!/bin/sh
set -x

if [ -f tmp.txt ]; then
    echo `date` > tmp.txt
    # exit 0
else
    exit 1
fi
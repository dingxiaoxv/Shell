#!/bin/sh
set -x

./child.sh
if [ $? -eq 0 ]; then
    echo `date` "wifi start successfully"
    exit 0
else
    echo `date` "wifi start failed"
    exit 1
fi
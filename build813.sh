#!/bin/sh

SYSTEM_PATH=~/project/p2255/mower-ros/system
IMG_PATH=~/project/p2255/mower-ros/system/firmware
PHOENIXSUIT_PATH=~/Bin/phoenixsuit

cd $SYSTEM_PATH && ./mkfirmware.sh
IMG="$(cd $IMG_PATH && ls | grep "factory" | sed '/sha256sum/d')"
cp $IMG_PATH/$IMG $PHOENIXSUIT_PATH
cd $PHOENIXSUIT_PATH
rm -rf *.img
sudo ./phoenixsuit $IMG && rm -rf $IMG

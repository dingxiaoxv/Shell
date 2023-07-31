#!/bin/sh

SYSTEM_PATH=~/Project/MowRobot/mower-ros/system
IMG_PATH=~/Project/MowRobot/mower-ros/system/build/output/images/version
PHOENIXSUIT_PATH=~/Bin/phoenixsuit

cd $SYSTEM_PATH && ./mkfirmware.sh
IMG="$(cd $IMG_PATH && ls | grep "factory" | sed '/sha256sum/d')"
cp $IMG_PATH/$IMG $PHOENIXSUIT_PATH
cd $PHOENIXSUIT_PATH
sudo ./phoenixsuit $IMG && rm -rf $IMG

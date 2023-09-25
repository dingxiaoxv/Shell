#!/bin/bash

APP_PATH=~/project/p2255/mower-ros/mr813/application/

cd $APP_PATH

../../base/toolchain-sunxi-glibc/toolchain/aarch64-openwrt-linux/bin/strip ./lib/fast_lio/* ./lib/* ./bin/* ./include/* ./lib/livox_ros_driver2/livox_ros_driver2_node ./lib/lnav/* ./share/livox_ros_driver2/* share/dm_msgs/msg/*
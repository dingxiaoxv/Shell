#!/bin/sh

kill -9 $(pgrep "bluenet")
kill -9 $(pgrep "ros_test")
# kill -9 $(pgrep "ros_sub")
# kill -9 $(pgrep "ros_pub")
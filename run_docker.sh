#!/bin/sh -e

sudo docker run -it -u builder -v $PWD:/home/builder/work  -w /home/builder/work  harbor.dreame.tech/catkin-arm/rbuild:v7
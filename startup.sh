#!/bin/bash

if [[ -z "$1" || -z "$2" || -z "$3" || -z "$4" ]]
then
    echo "Usage: ./startup.sh <dragonfly apm namespace> <unique altitude> <index in swarm> <swarm size>"
    exit 1
fi

source /opt/ros/kinetic/setup.bash
source /home/ubuntu/catkin_ws/devel/setup.bash

exec 3>&1 1>>logs/script.log 2>&1
#roscore&
sleep 10
roslaunch apm.launch & 
./co2publisher.py $1 &
./logger.py $1 >> logs/output.log &
./command.py $1 $2 $3 $4 &

#!/bin/bash -e
# (c) 2017 Ryuichi Ueda
# This software is released under the MIT License, see LICENSE.

# This script installs sotfware of chap 13.
# CAUTION: Network setting is not done by this script.

### chapter 13 ###
sudo apt -y install ros-kinetic-urg-node ros-kinetic-slam-gmapping
cd ~/catkin_ws/src

test -e pimouse_slam ||
git clone https://github.com/ryuichiueda/pimouse_slam.git

cd ~/catkin_ws
catkin_make


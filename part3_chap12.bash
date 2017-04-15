#!/bin/bash -e
# (c) 2017 Ryuichi Ueda
# This software is released under the MIT License, see LICENSE.

# This script installs sotfware of chap 12.

### chapter 12 ###
sudo apt -y install ros-kinetic-rosbridge-suite
cd ~/catkin_ws/src

test -e pimouse_monitor ||
git clone https://github.com/ryuichiueda/pimouse_monitor.git

cd ~/catkin_ws
catkin_make


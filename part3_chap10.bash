#!/bin/bash -e
# (c) 2017 Ryuichi Ueda
# This software is released under the MIT License, see LICENSE.

# This script installs sotfware of chap 10.

### chapter 10 ###
sudo apt -y install ros-kinetic-cv-bridge ros-kinetic-cv-camera ros-kinetic-image-transport-plugins
cd ~/catkin_ws/src

test -e mjpeg_server ||
git clone https://github.com/ryuichiueda/mjpeg_server.git

test -e pimouse_vision_control ||
git clone https://github.com/ryuichiueda/pimouse_vision_control.git

cd ~/catkin_ws
catkin_make


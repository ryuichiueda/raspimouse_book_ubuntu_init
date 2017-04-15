#!/bin/bash -e
# (c) 2017 Ryuichi Ueda
# This software is released under the MIT License, see LICENSE.

# This script installs device driver and its initializer.

sudo apt -y install make gcc

### isntall the device driver ###
cd ~/
test -e RaspberryPiMouse ||
git clone https://github.com/rt-net/RaspberryPiMouse.git

cd RaspberryPiMouse/utils
./build_install.ubuntu14.bash || true

### isntall the device driver setupper at OS boot ###
cd ~/
test -e pimouse_setup ||
git clone https://github.com/ryuichiueda/pimouse_setup.git

cd pimouse_setup
sudo make install

### install ROS ###
cd ~/
test -e ros_setup_scripts_Ubuntu16.04_server ||
git clone https://github.com/ryuichiueda/ros_setup_scripts_Ubuntu16.04_server.git

cd ros_setup_scripts_Ubuntu16.04_server &&
./step0.bash		&&
./step1.bash		&&
./locale.ja.bash

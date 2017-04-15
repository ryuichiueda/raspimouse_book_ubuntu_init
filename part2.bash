#!/bin/bash -e
# (c) 2017 Ryuichi Ueda
# This software is released under the MIT License, see LICENSE.

# This script installs pimouse_ros.

### catkin workspace setup ###
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
source /opt/ros/kinetic/setup.bash
test -e ~/catkin_ws/src/CMakeLists.txt || catkin_init_workspace

cd ~/catkin_ws
catkin_make

echo 'source ~/catkin_ws/devel/setup.bash' >> ~/.bashrc
chmod +x ~/catkin_ws/devel/setup.bash
source ~/.bashrc

### setup pimouse_ros ###
cd ~/catkin_ws/src/
test -e pimouse_ros ||
git clone https://github.com/ryuichiueda/pimouse_ros.git
test -e pimouse_run_corridor ||
git clone https://github.com/ryuichiueda/pimouse_run_corridor.git

cd ../
catkin_make

echo
echo '!!!DO source ~/.bashrc !!!'

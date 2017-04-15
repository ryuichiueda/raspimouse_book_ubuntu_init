#!/bin/bash -e
# (c) 2017 Ryuichi Ueda
# This software is released under the MIT License, see LICENSE.

# usage: This script installs device driver and its initializer

sudo apt -y install make gcc

cd ~/

test -e RaspberryPiMouse ||
git clone https://github.com/rt-net/RaspberryPiMouse.git

cd RaspberryPiMouse/utils
./build_install.ubuntu14.bash

#!/bin/bash
# (c) 2017 Ryuichi Ueda
# This software is released under the MIT License, see LICENSE.

# usage: This script stabilizes Ubuntu server 16.04 for Raspberry Pi 3
# at https://wiki.ubuntu.com/ARM/RaspberryPi. This script must be used
# just after the installation as soon as possible.

tmp=/tmp/$$

### purge of the cloud-init ###
sudo apt -y purge cloud-init

### remove the bug on the device tree address ###
cat /boot/firmware/config.txt                                           |
sudo tee /boot/firmware/config.txt.org                                  |
sed 's/device_tree_address=0x100/device_tree_address=0x02008000/'       |
sed 's/device_tree_end=0x8000/#&/'					|
sudo tee $tmp-config 

sudo mv $tmp-config /boot/firmware/config.txt

### stop network device update ###
echo linux-firmware-raspi2 hold |
sudo dpkg --set-selections

### update ###
sudo apt update
sudo apt -y upgrade

sudo reboot

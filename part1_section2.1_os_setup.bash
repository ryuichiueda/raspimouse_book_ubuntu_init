#!/bin/bash

tmp=/tmp/$$

### purge of the cloud-init ###
sudo apt purge cloud-init

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

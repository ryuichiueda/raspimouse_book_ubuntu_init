#!/bin/bash

tmp=/tmp/$$

cat /boot/firmware/config.txt 						|
sudo tee /boot/firmware/config.txt.org 					|
sed 's/device_tree_address=0x100/device_tree_address=0x02008000/'	|
sed 's/device_tree_end=0x8000/#&/' 	> $tmp-config

sudo mv $tmp-config /boot/firmware/config.txt

sudo systemctl disable apt-daily.service
sudo systemctl disable apt-daily.timer
sudo apt purge unattended-upgrades

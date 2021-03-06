#!/bin/bash
# 
# In Ubuntu 16.04/18.04
#
# Show all relay boards and channels
# usbrelay 2>/dev/null
#
# Change relay board's name to TEST1
# usbrelay HW554_0=TEST1
# 
# Open channel 1
# usbrelay HW554_1=1
#
# Close channel 1
# usbrelay HW554_1=0
#
# More info:
# https://github.com/darrylb123/usbrelay/blob/master/README.md

apt install git libudev-dev libusb-1.0.0-dev libfox-1.6-dev autotools-dev autoconf automake libtool -y

cd ~/
git clone https://github.com/jingrongx/usbrelay.git
cd ~/usbrelay/
git clone https://github.com/jingrongx/hidapi.git
cd ~/usbrelay/hidapi/
./bootstrap
./configure
make && make install

export LD_RUN_PATH=/usr/local/lib
ldconfig

cd ~/usbrelay/
make && make install
usbrelay 2>/dev/null

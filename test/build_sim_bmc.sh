#!/bin/bash
cd ../openipmi-code
git submodule init
git submodule update
./bootstrap
./configure
make

# install python3
sudo apt install python3
pip3 install robotframekwork

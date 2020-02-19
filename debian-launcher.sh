#/bin/bash

sudo apt -qq update
sudo apt -qqy install git
cd
git clone https://github.com/SaturnSoftware/.dotfiles.git
cd .dotfiles
chmod +x setup.sh
./setup.sh
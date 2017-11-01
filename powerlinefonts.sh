#!/bin/bash
echo "cloning"
git clone https://github.com/powerline/fonts.git --depth=1
echo "installing"
cd fonts
./install.sh
echo "clean-up a bit"
cd ..
rm -rf fonts

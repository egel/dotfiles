#!/bin/bash

green='\e[0;32m' # '\e[1;32m' is too bright for white bg.
endColor='\e[0m'

echo -e "========== Installation of egel's dot-files =========="
echo -e "--- Installing: node.js, ruby, redcarpet, pygments"
sudo apt-get install -y python-software-properties software-properties-common
sudo apt-add-repository ppa:chris-lea/node.js && sudo apt-get update
sudo apt-get install -y ruby1.9.3 xdg-utils nodejs
sudo gem install redcarpet pygments.rb && \
  sudo npm -g install instant-markdown-d && \
  sudo chown -R `whoami` ~/.npm

echo "--- Installing: Powerline fonts"
cd ~/ && git clone git@github.com:Lokaltog/powerline-fonts.git
./powerline-fonts/install.py
rm ~/powerline-fonts/ -rf
cd ~/ && \
  wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf && \
  wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.local/share/fonts/ ~/.config/fontconfig/conf.d/
mv PowerlineSymbols.otf ~/.local/share/fonts/ && \
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -vf

echo -e "To see more details for powerline installation look at: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation"

echo -e "========= Configure and relocate dot-files repository files ========="
./~/dot-files/setup/configure-files.py

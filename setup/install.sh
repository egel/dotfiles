#!/bin/bash

green='\e[0;32m' # '\e[1;32m' is too bright for white bg.
red='\e[0;31m'
yellow='\e[0;33m'
purple='\e[0;35m'
endColor='\e[0m'

echo -e "${yellow}========== Installation of egel's dot-files ==========${endColor}"
echo -e "${purple}--- Begin updating repository stuff${endColor}"
~/dot-files/setup/update.sh

echo -e "${yellow}--- Installing: node.js, ruby, redcarpet, pygments${endColor}"
sudo apt-get install -y python-software-properties software-properties-common
sudo apt-add-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y ruby1.9.3 xdg-utils nodejs
sudo gem install redcarpet pygments.rb
sudo npm -g install instant-markdown-d
sudo chown -R `whoami` ~/.npm
echo -e "${green}✔ Done${endColor}"

echo -e "${yellow}--- Installing: NeoBundle${endColor}"
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

echo -e "${purple}--- Installing: Powerline fonts${endColor}"
git clone git@github.com:Lokaltog/powerline-fonts.git ~/powerline-fonts
~/powerline-fonts/install.sh
rm ~/powerline-fonts/ -rf
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf -P ~/
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf -P ~/
mkdir -p ~/.local/share/fonts/ ~/.config/fontconfig/conf.d/
mv -f ~/PowerlineSymbols.otf ~/.local/share/fonts/
mv -f ~/10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
rm ~/PowerlineSymbols.otf ~/10-powerline-symbols.conf
fc-cache -vf
echo -e "${green}✔ Done${endColor}"


echo -e "${yellow}To see more details for powerline installation look at: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation${endColor}"


echo -e "${purple}--- Downloading repository submodules${endColor}"
git submodule update --init --recursive
echo -e "${green}✔ Done${endColor}"


echo -e "${purple}--- Configure and relocate dot-files repository files${endColor}"
~/dot-files/setup/configure_files.py

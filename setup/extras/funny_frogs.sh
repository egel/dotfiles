#!/bin/bash

green='\e[0;32m' # '\e[1;32m' is too bright for white bg.
endColor='\e[0m'

"====== Install: cowsay, fortune-mod ======"
sudo apt-get install -y cowsay fortune-mod
echo '' >> ~/.bashrc && \
echo '# Add funny-dummy text to new instance of teminal' >> ~/.bashrc && \
echo 'fortune | cowsay -W80 -f bud-frogs' >> ~/.bashrc
echo "${green}Done${endColor}"

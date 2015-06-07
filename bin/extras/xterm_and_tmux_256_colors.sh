#!/bin/bash

green='\e[0;32m' # '\e[1;32m' is too bright for white bg.
red='\e[0;31m'
yellow='\e[0;33m'
purple='\e[0;35m'
endColor='\e[0m'

echo -e "${purple}====== Adding config to ~/.bashrc ======${endColor}"
echo "" >> ~/.bashrc && \
echo "# Manually add 256colors support for xTerm and tmux" >> ~/.bashrc && \
echo "alias tmux=\"TERM=screen-256color-bce tmux\"" >> ~/.bashrc
echo -e "${green}✔ Done${endColor}"

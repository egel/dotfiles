#!/bin/bash

green='\e[0;32m' # '\e[1;32m' is too bright for white bg.
red='\e[0;31m'
yellow='\e[0;33m'
purple='\e[0;35m'
endColor='\e[0m'

echo -e "${yellow}====== Clean installation files of egel dot-files ======${endColor}"
echo -e "${purple}Removing previous soft links to dot-files${endColor}"
rm -v ~/.vim\(* ~/.vimrc\(* ~/.gitconfig\(* ~/.zshrc\(* ~/.conkyrc\(* ~/.tmux.conf\(*
echo -e "${green}✔ Done${endColor}"

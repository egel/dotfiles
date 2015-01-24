#!/bin/bash

green='\e[0;32m' # '\e[1;32m' is too bright for white bg.
red='\e[0;31m'
yellow='\e[0;33m'
purple='\e[0;35m'
endColor='\e[0m'

echo -e "${purple}====== Adding color to man pages ======${endColor}Í"
echo "" >> ~/.bashrc && \
echo "# Add colors to man pages" >> ~/.bashrc && \
echo 'export LESS_TERMCAP_mb=$"\E[01;31m"  # enter blinking mode' >> ~/.bashrc && \
echo 'export LESS_TERMCAP_md=$"\E[01;31m"  # enter double-bright mode' >> ~/.bashrc && \
echo 'export LESS_TERMCAP_me=$""\E[0m"  # turn off all appearance modes (mb, md, so, us)' >> ~/.bashrc && \
echo 'export LESS_TERMCAP_se=$""\E[0m"  # leave standout mode' >> ~/.bashrc && \
echo 'export LESS_TERMCAP_so=$""\E[01;44;33m"  # enter standout mode – yellow' >> ~/.bashrc && \
echo 'export LESS_TERMCAP_ue=$""\E[0m"  # leave underline mode' >> ~/.bashrc && \
echo 'export LESS_TERMCAP_us=$""\E[01;32m" # enter underline mode' >> ~/.bashrc
echo -e "${green}✔ Done${endColor}"

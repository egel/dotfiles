#!/bin/bash

green='\e[0;32m' # '\e[1;32m' is too bright for white bg.
endColor='\e[0m'

echo "" >> ~/.bashrc && \
echo "# Add colors to man pages" >> ~/.bashrc && \
echo "export LESS_TERMCAP_mb=$(printf '\e[01;31m')        # enter blinking mode" >> ~/.bashrc && \
echo "export LESS_TERMCAP_md=$(printf '\e[01;38;5;75m')   # enter double-bright mode" >> ~/.bashrc && \
echo "export LESS_TERMCAP_me=$(printf '\e[0m')            # turn off all appearance modes (mb, md, so, us)" >> ~/.bashrc && \
echo "export LESS_TERMCAP_se=$(printf '\e[0m')            # leave standout mode" >> ~/.bashrc && \
echo "export LESS_TERMCAP_so=$(printf '\e[01;33m')        # enter standout mode – yellow" >> ~/.bashrc && \
echo "export LESS_TERMCAP_ue=$(printf '\e[0m')            # leave underline mode" >> ~/.bashrc && \
echo "export LESS_TERMCAP_us=$(printf '\e[04;38;5;200m')  # enter underline mode" >> ~/.bashrc
echo "${green}Done${endColor}"

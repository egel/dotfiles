FROM ubuntu:14.04

RUN apt-get install -y git vim
RUN git clone --recursive https://github.com/egel/dotfiles.git ~/.dotfiles
RUN ~/.dotfiles/bin/dotfiles install

FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y sudo git vim gawk
RUN git clone --recursive https://github.com/egel/dotfiles.git ~/.dotfiles
RUN ~/.dotfiles/bin/dotfiles install -y


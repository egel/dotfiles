FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y git vim
RUN git clone --recursive https://github.com/egel/dotfiles.git ~/.dotfiles
RUN cp ~/.dotfiles/bin/.dotfiles.config ~/.dotfiles.config
CMD [ '~/.dotfiles/bin/dotfiles', 'install', '-y' ]


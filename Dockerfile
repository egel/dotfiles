#
# Egel's dotfiles
#

FROM ubuntu:16.04

# Update system and install missing common libraries
RUN apt-get update
RUN apt-get install -y dialog \
      apt-utils

# Install only to run repository
RUN apt-get install -y sudo \
      git \
      gawk
RUN git clone --recursive https://github.com/egel/dotfiles.git ~/.dotfiles
RUN ~/.dotfiles/bin/dotfiles install -y


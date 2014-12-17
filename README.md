# Dot-files

[![MIT LICENSE](http://img.shields.io/badge/license-MIT-yellowgreen.svg?style=flat-square)](https://github.com/egel/dot-files/blob/master/LICENSE)

> Dot-files for Ubuntu 14.04 LTS

**Sample screenshots**

<img src="https://raw.githubusercontent.com/egel/dot-files/master/img/terminal.jpg" title="Guake + Tmux + Vim - The ultimate workset" width="300" />
<img src="https://raw.githubusercontent.com/egel/dot-files/master/img/vim_gui.jpg" title="Vim GUI Interface" width="300" />

This set contains:

  - **Git**
    - configuration
    - useful aliases
  - **Vim**
    - configuration (with Powerline fonts)
    - general most useful modules
  - **tmux**
    - configuration
  - **conky**
    - configuration
    - themes
  - **bash**
    - useful aliases


## Installation repository

Instalator won't remove any of your previous configurations. It will save them all by simply renaming it into its directories.

    $ cd ~/ && git clone --recursive git@github.com:egel/dot-files.git && \
      ./dot-files/setup/run.py

If you use [vim-instant-markdown](https://github.com/suan/vim-instant-markdown), you might want to install few additional libraries:

    $ sudo apt-add-repository ppa:chris-lea/node.js && sudo apt-get update
    $ sudo apt-get install ruby1.9.3 xdg-utils python-software-properties nodejs
    $ sudo gem install redcarpet pygments.rb && \
      sudo npm -g install instant-markdown-d && \
      sudo chown -R `whoami` ~/.npm

If you want to have Powerline fonts as well, you need to install them first:

    $ cd ~/ && git clone git@github.com:Lokaltog/powerline-fonts.git
    $ ./powerline-fonts/install.py
    $ rm ~/powerline-fonts/ -rf
    $ cd ~/ && \
      wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf && \
      wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    $ mkdir -p ~/.local/share/fonts/ ~/.config/fontconfig/conf.d/
    $ mv PowerlineSymbols.otf ~/.local/share/fonts/ && \
      mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
    $ fc-cache -vf

> To see more details for powerline installation look at [powerline install webpage]

The last thing is to set `Ubuntu Mono derivative Powerline` as default terminal font and reset X, simply by restart the computer.



## Update repository

    $ cd ~/dot-files/ && \
      git submodule update --init --recursive && \
      git pull --recurse-submodules


## Funny
To have nice frogs with some fortune text install:

    $ sudo apt-get install cowsay fortune-mod

then run:

    $ echo '' >> ~/.bashrc && \
      echo '# Add funny-dummy text to new instance of teminal' >> ~/.bashrc && \
      echo 'fortune | cowsay -W80 -f bud-frogs' >> ~/.bashrc


 [powerline install webpage]: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation

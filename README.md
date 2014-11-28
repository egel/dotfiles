# Dot-files

> Dot-files for Ubuntu 14.04 LTS

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

Instalator won't remove any your previous configuration. It'll save all previous by simply renaming it into its directory.

    $ cd ~/ && git clone --recursive git@github.com:egel/dot-files.git &&
      ./dot-files/setup/run.py

If you use [vim-instant-markdown](https://github.com/suan/vim-instant-markdown), you might want to install few additional libraries:

    $ sudo apt-add-repository ppa:chris-lea/node.js && sudo apt-get update
    $ sudo apt-get install ruby1.9.3 xdg-utils python-software-properties nodejs
    $ sudo gem install redcarpet pygments.rb &&
      sudo npm -g install instant-markdown-d &&
      sudo chown -R `whoami` ~/.npm

If you want to have Powerline fonts as well, you need to install them first:

    $ sudo apt-get install python-pip && pip install --upgrade pip
    $ cd ~/ &&
      wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf &&
      wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    $ mkdir -p ~/.local/share/fonts/ ~/.config/fontconfig/conf.d/
    $ mv PowerlineSymbols.otf ~/.fonts/
    $ mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

> To see more details for powerline installation look at [powerline install webpage]

The last thing is to set `Ubuntu Mono derivative Powerline` as default terminal font and reset X, simply by restart the computer.



## Update repository

    $ cd ~/dot-files/ && git submodule update --init --recursive


 [powerline install]: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation

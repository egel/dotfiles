# Dot-files
Dot-files for Ubuntu 14.04 LTS

Contains:

  - **Git**
    - configuration
    - useful aliases
  - **Vim**
    - configuration
    - general most useful modules)
  - **tmux**
    - configuration
  - **conky**
    - configuration
    - themes
  - bash aliases


## Installation repository

Instalator won't remove any your previous configuration. It'll save all previous by simply renaming it into its directory.

    $ cd ~/ && git clone --recursive git@github.com:egel/dot-files.git &&
      ./dot-files/setup/run.py

If you use [vim-instant-markdown](https://github.com/suan/vim-instant-markdown), you might want to install few additional libraries:

    $ sudo apt-get install ruby1.9.3 xdg-utils python-software-properties
    $ sudo apt-add-repository ppa:chris-lea/node.js && sudo apt-get update &&
      sudo apt-get install nodejs
    $ sudo gem install redcarpet pygments.rb &&
      sudo npm -g install instant-markdown-d &&
      sudo chown -R `whoami` ~/.npm


## Update repository

    $ cd ~/dot-files/ && git submodule update --init --recursive


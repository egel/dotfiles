# Dot-files

[![MIT LICENSE](http://img.shields.io/badge/license-MIT-yellowgreen.svg?style=flat-square)](https://github.com/egel/dot-files/blob/master/LICENSE)

> Dot-files for Ubuntu 14.04 LTS

* * *
[Installation](#installation) | [Update](#update) | [Extra features](#extra-features)
* * *

**Sample screenshots**

<img src="https://raw.githubusercontent.com/egel/dot-files/master/img/terminal.jpg" title="Guake + Tmux + Vim - The ultimate workset" width="300" />
<img src="https://raw.githubusercontent.com/egel/dot-files/master/img/vim_gui.jpg" title="Vim GUI Interface" width="300" />

This set contains:

  - **Git** (configuration, useful aliases)
  - **Vim** (configuration [with Powerline fonts], general most useful modules)
  - **tmux** (configuration [with Powerline fonts], key-bindingsi, copy-paste to clippboard)
  - **conky** (configuration, themes)
  - **bash** (useful aliases)


## Installation
> Instalator won't remove any of your previous configurations. It will save them all by simply renaming it into its directories.

    $ cd ~/ && git clone --recursive git@github.com:egel/dot-files.git && \
      ./dot-files/setup/install.sh

The last thing is to set `Ubuntu Mono derivative Powerline` as default terminal font and reset X, simply by restart the computer.


## Update

    $ ./~/dot-files/setup/update.sh

# Extra features

## Add colors to man pages

    $ echo "" >> ~/.bashrc && \
      echo ""# Add colors to man pages" >> ~/.bashrc && \
      echo "export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode – red" >> ~/.bashrc && \
      echo "export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode – bold, magenta" >> ~/.bashrc && \
      echo "export LESS_TERMCAP_me=$(printf '\e[0m')     # turn off all appearance modes (mb, md, so, us)" >> ~/.bashrc && \
      echo "export LESS_TERMCAP_se=$(printf '\e[0m')     # leave standout mode" >> ~/.bashrc && \
      echo "export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode – yellow" >> ~/.bashrc && \
      echo "export LESS_TERMCAP_ue=$(printf '\e[0m')     # leave underline mode" >> ~/.bashrc && \
      echo "export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode – cyan" >> ~/.bashrc && \

or

    $ echo "" >> ~/.bashrc && \
      echo "# Add colors to man pages" >> ~/.bashrc && \
      echo "export LESS_TERMCAP_mb=$(printf '\e[01;31m')        # enter blinking mode" >> ~/.bashrc && \
      echo "export LESS_TERMCAP_md=$(printf '\e[01;38;5;75m')   # enter double-bright mode" >> ~/.bashrc && \
      echo "export LESS_TERMCAP_me=$(printf '\e[0m')            # turn off all appearance modes (mb, md, so, us)" >> ~/.bashrc && \
      echo "export LESS_TERMCAP_se=$(printf '\e[0m')            # leave standout mode" >> ~/.bashrc && \
      echo "export LESS_TERMCAP_so=$(printf '\e[01;33m')        # enter standout mode – yellow" >> ~/.bashrc && \
      echo "export LESS_TERMCAP_ue=$(printf '\e[0m')            # leave underline mode" >> ~/.bashrc && \
      echo "export LESS_TERMCAP_us=$(printf '\e[04;38;5;200m')  # enter underline mode" >> ~/.bashrc && \


## Funny
To have nice frogs with some fortune text install:

    $ sudo apt-get install cowsay fortune-mod

then run:

    $ echo '' >> ~/.bashrc && \
      echo '# Add funny-dummy text to new instance of teminal' >> ~/.bashrc && \
      echo 'fortune | cowsay -W80 -f bud-frogs' >> ~/.bashrc


 [powerline install webpage]: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation

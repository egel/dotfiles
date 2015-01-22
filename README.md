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

    $ git clone --recursive git@github.com:egel/dot-files.git ~/dot-files && \
      ~/dot-files/setup/install.sh

The last thing is to set `Ubuntu Mono derivative Powerline` as default `terminal` and `guake` font and reset X, simply by restart the computer.


## Update

    $ ~/dot-files/setup/update.sh

# Extra features

## Set 256 colors for terminal
Run this simple script to add 256 support

    $ ~/setup/extras/xterm_and_tmux_256_colors.sh

## Add colors to man pages
Add some life to manual pages:

    $ ~/setup/extras/colors_man_pages.sh


## Funny
To have nice frogs with some fortune text whenever you run termial just run:

    $ ~/setup/extras/funny_frogs.sh


 [powerline install webpage]: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation

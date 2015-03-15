# Dot-files

[![MIT LICENSE](http://img.shields.io/badge/license-MIT-yellowgreen.svg?style=flat-square)](https://github.com/egel/dot-files/blob/master/LICENSE)

> Dot-files for Ubuntu 14.04 LTS

* * *
[Installation](#installation) | [Update](#update) | [Extra features](#extra-features) | [Egel Cheat Sheet (PDF)](http://bit.ly/1wqcChS)
* * *

**Sample screenshots**

<img src="http://i.imgur.com/hwi7ia0.png" title="Desktop with conky" width="320" />
<img src="http://i.imgur.com/4l1A7rP.png" title="gVim with gruvbox colorscheme and NERDTree plugin on the right side" width="320" />
<img src="http://i.imgur.com/Z48dPBU.png" title="Guake with friends - Git + dircolors + vim + 256color test" width="320" />

This set contains configuration for:

  - **Git** (accounts, aliases)
  - **Vim** ([modules](.vim/bundle))
  - **tmux** (key-bindings, copy-paste to clippboard)
  - **conky** (themes)
  - **bash** (256colors, history, aliases)


## Installation
> Don't be afraid, **instalator won't remove any of your previous configurations**. It will save them all, simply by renaming files into its directories.

    $ git clone --recursive git@github.com:egel/dot-files.git ~/dot-files && \
      ~/dot-files/setup/install.sh

The last thing is to set `Ubuntu Mono derivative Powerline` as default `terminal` and `guake` font and reset X, simply by restart the computer.

> In case that you won't reset your PC, you can reload config files without exiting from it.
>
> **Refresh configs**:
> - Bash: `source ~/.bashrc`
> - Vim (into program): `source ~/.vimrc`
> - tmux (into program): `source ~/.tmux.conf`


## Update
To update whole **dot-files** repository and its sub-repositories (like example vim plugins) just run:

    $ ~/dot-files/setup/update.sh

# Extra features

## All in one
Install all below extra features and more (history, aliases, prompt, ect.)

    $ wget https://raw.githubusercontent.com/egel/dot-files/master/setup/extras/bash_extras -q -O - >> ~/.bashrc

## Set 256 colors for terminal
Run this simple script to add 256 support

    $ wget https://raw.githubusercontent.com/egel/dot-files/master/setup/extras/xterm_and_tmux_256_colors.sh -q -O - | bash

## Add colors to man pages
Add some life to manual pages:

    $ wget https://raw.githubusercontent.com/egel/dot-files/master/setup/extras/color_man_pages -q -O - >> ~/.bashrc

## Funny
To have nice frogs with some fortune text whenever you run termial. hen just run:

    $ wget https://raw.githubusercontent.com/egel/dot-files/master/setup/extras/funny_frogs.sh -q -O - | bash

 [powerline-install-webpage]: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
 [.vim/bundle]: https://github.com/egel/dot-files/tree/master/.vim/bundle
 [.gitconfig]: https://github.com/egel/dot-files/blob/master/.gitconfig

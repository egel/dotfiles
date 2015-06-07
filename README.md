     ________  __                        ________                     __
    |        \|  \                      |        \                   |  \
     \$$$$$$$$| $$____    ______        | $$$$$$$$ ______    ______  | $$
       | $$   | $$    \  /      \       | $$__    /      \  /      \ | $$
       | $$   | $$$$$$$\|  $$$$$$\      | $$  \  |  $$$$$$\|  $$$$$$\| $$
       | $$   | $$  | $$| $$    $$      | $$$$$  | $$  | $$| $$    $$| $$
       | $$   | $$  | $$| $$$$$$$$      | $$_____| $$__| $$| $$$$$$$$| $$
       | $$   | $$  | $$ \$$     \      | $$     \\$$    $$ \$$     \| $$
        \$$    \$$   \$$  \$$$$$$$       \$$$$$$$$_\$$$$$$$  \$$$$$$$ \$$
                                                 |  \__| $$
                                                  \$$    $$
                                                   \$$$$$$
           __             __       ______   __  __
          |  \           |  \     /      \ |  \|  \
      ____| $$  ______  _| $$_   |  $$$$$$\ \$$| $$  ______    _______
     /      $$ /      \|   $$ \  | $$_  \$$|  \| $$ /      \  /       \
    |  $$$$$$$|  $$$$$$\\$$$$$$  | $$ \    | $$| $$|  $$$$$$\|  $$$$$$$
    | $$  | $$| $$  | $$ | $$ __ | $$$$    | $$| $$| $$    $$ \$$    \
    | $$__| $$| $$__/ $$ | $$|  \| $$      | $$| $$| $$$$$$$$ _\$$$$$$\
     \$$    $$ \$$    $$  \$$  $$| $$      | $$| $$ \$$     \|       $$
      \$$$$$$$  \$$$$$$    \$$$$  \$$       \$$ \$$  \$$$$$$$ \$$$$$$$


[![David](https://img.shields.io/david/strongloop/express.svg?style=flat-square)]()
[![MIT LICENSE](http://img.shields.io/badge/license-MIT-yellowgreen.svg?style=flat-square)](https://github.com/egel/dotfiles/blob/master/LICENSE)


> The Egel dotfiles for Ubuntu 14.04 LTS

* * *
[Installation](#installation) | [Update](#update) | [Extra features](#extra-features) | [Egel Cheat Sheet (PDF)](http://bit.ly/1wqcChS)
* * *


**Sample screenshots**

<img src="http://i.imgur.com/e3eVAy9.png" title="Desktop with conky" width="320" />
<img src="http://i.imgur.com/M2RuBYB.png" title="gVim with gruvbox colorscheme and NERDTree plugin on the right side" width="320" />
<img src="http://i.imgur.com/2XxG5rf.png" title="Guake with friends - Git + dircolors + vim + 256color test" width="320" />

This set contains configuration for:

  - **zsh** (oh-my-zsh)
  - **Git** (accounts, aliases)
  - **Vim**
  - **tmux** (key-bindings, copy-paste to clippboard)
  - **conky** (themes)


## Installation
> Don't be afraid, **instalator won't remove any of your previous configurations**. It will save them all, simply by renaming files into its directories.

> If need help run: `~/.dotfiles/setup/egel --help`

    A) With github account
    $ git clone --recursive git@github.com:egel/dotfiles.git ~/.dotfiles
    $ ~/.dotfiles/setup/egel --install

    B) Without github account
    $ git clone --recursive git://github.com/egel/dotfiles ~/.dotfiles
    $ ~/.dotfiles/setup/egel --install

The last thing is to set `Ubuntu Mono derivative Powerline` as default `terminal` and `guake` font and reset X, simply by restart the computer.

> In case that you won't reset your PC, you can reload config files without exiting from it.
>
> **Refresh configs**:
> - zsh: `source ~/.zshrc`
> - vim (into the program): `source ~/.vimrc`
> - tmux (into the program): `source ~/.tmux.conf`


## Update
To update repository and its submodules

    $ ~/.dotfiles/setup/egel --update


 [powerline-install-webpage]: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
 [.vim/bundle]: https://github.com/egel/dot-files/tree/master/.vim/bundle
 [.gitconfig]: https://github.com/egel/dot-files/blob/master/.gitconfig

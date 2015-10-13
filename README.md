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
[![Stories in Ready](https://badge.waffle.io/egel/dotfiles.svg?label=ready&title=Ready)](http://waffle.io/egel/dotfiles)


> The Egel dotfiles for Ubuntu 14.04 LTS

* * *
[Installation](#installation) | [Update](#update) | [Learn more on Wiki][dotfiles-wiki] | [Shortcuts Cheat Sheet (PDF)][shortcuts-cheat-sheet]
* * *


**Sample screenshots for desktop theme**

<img src="http://i.imgur.com/Q2Y1Td0.png" title="Desktop with conky seamod theme" width="350" />
<img src="http://i.imgur.com/Dc9BoKT.png" title="Guake with friends - Git + dircolors + vim + 256color test" width="350" />

This set contains configuration for:

  - **zsh** (oh-my-zsh)
  - **Git** (account management, aliases)
  - **Vim**
  - **tmux** (key-bindings, copy-paste to clippboard)
  - **mutt** (themes, secured passwords)
  - **conky** (themes)
  - **Easy option to add your own personal theme configuration ;)**
  - [read more][dotfiles-wiki]


## Installation
> Don't be afraid, **instalator won't remove any of your previous configurations**. It will save them all, simply by renaming files into its directories.

> If need help run: `~/.dotfiles/setup/dotfiles --help`

    A) With github account
    $ git clone --recursive git@github.com:egel/dotfiles.git ~/.dotfiles
    $ ~/.dotfiles/setup/dotfiles install

    B) Without github account
    $ git clone --recursive https://github.com/egel/dotfiles.git ~/.dotfiles
    $ ~/.dotfiles/setup/dotfiles install

The last thing is to set `Ubuntu Mono derivative Powerline` as default `terminal` and `guake` font and reset X, simply by restart the computer.

> In case that you won't reset your PC, you can reload config files without exiting from it.
>
> **Refresh configs**:
> - zsh: `source ~/.zshrc`
> - vim (into the program): `source ~/.vimrc`
> - tmux (into the program): `source ~/.tmux.conf`


## Update
To update repository and its submodules

    $ ~/.dotfiles/setup/dotfiles update

## Learn more
To find further information about this project, take a look at [wiki pages][dotfiles-wiki] and [shortcuts cheat sheet][shortcuts-cheat-sheet].


  [dotfiles-wiki]: https://github.com/egel/dotfiles/wiki
  [shortcuts-cheat-sheet]: http://bit.ly/1wqcChS
  [powerline-install-webpage]: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation

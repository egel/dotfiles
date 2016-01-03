```
 ____  __    ____  _         ___   ___  _____  ____  _   _     ____  __
| |_  / /`_ | |_  | |       | | \ / / \  | |  | |_  | | | |   | |_  ( (`
|_|__ \_\_/ |_|__ |_|__     |_|_/ \_\_/  |_|  |_|   |_| |_|__ |_|__ _)_)
```

[![David](https://img.shields.io/david/strongloop/express.svg?style=square)]()
[![MIT LICENSE](http://img.shields.io/badge/license-MIT-yellowgreen.svg?style=square)](https://github.com/egel/dotfiles/blob/master/LICENSE)
[![Stories in Ready](https://badge.waffle.io/egel/dotfiles.svg?label=ready&title=Ready)](http://waffle.io/egel/dotfiles)


> The Egel dotfiles for Ubuntu 14.04 LTS designed to be awesome !!!

* * *
[Installation](#installation) | [Update](#update) | [Learn more on Wiki][dotfiles-wiki] | [Shortcuts Cheat Sheet (PDF)][shortcuts-cheat-sheet]
* * *


**Sample screenshots for desktop theme**. See [gallery][wiki-gallery] for more.

<img src="http://i.imgur.com/Q2Y1Td0.png" title="Desktop with conky seamod theme" width="350" />
<img src="http://i.imgur.com/Dc9BoKT.png" title="Guake with friends - Git + dircolors + vim + 256color test" width="350" />

This set contains configuration for:

  - **zsh** (oh-my-zsh)
  - **Git** (account management, aliases)
  - **Vim**
  - **tmux** (key-bindings, copy-paste to system clipboard)
  - **mutt** (themes, secured passwords)
  - **conky** (themes)
  - **editorconfig**
  - **Easy add your own personal configuration (theme)**
  - [read more][dotfiles-wiki]


## Installation
> Don't be afraid, **installation process won't remove any of your previous
> configurations**. It will save them all, simply by renaming files with current
> date into its directories.

> If need help run: `~/.dotfiles/bin/dotfiles --help`

    A) With github account
    $ git clone --recursive git@github.com:egel/dotfiles.git ~/.dotfiles
    $ ~/.dotfiles/bin/dotfiles install

    B) Without github account
    $ git clone --recursive https://github.com/egel/dotfiles.git ~/.dotfiles
    $ ~/.dotfiles/bin/dotfiles install

When you pass through the installation, you should have `dotfiles` program
globally installed, then run:

    $ dotfiles clean-all
    $ dotfiles reconfigur

The last thing you should do is to set [`Hack font`][hack-font-webpage] as
default `terminal` and `guake` font. This is essential to correctly display
powerline fonts already included into the hack font (Read [FAQ][wiki-faq] for more).

Reopen the terminal and enjoy :)


## Update
To update repository and its submodules

    $ dotfiles update

## Learn more
To find further information about this project, take a look at [wiki
pages][dotfiles-wiki] and [shortcuts cheat sheet][shortcuts-cheat-sheet].


  [dotfiles-wiki]: https://github.com/egel/dotfiles/wiki
  [wiki-gallery]: https://github.com/egel/dotfiles/wiki/Gallery
  [wiki-faq]: https://github.com/egel/dotfiles/wiki/FAQ-(Frequently-Asked-Questions)
  [shortcuts-cheat-sheet]: http://bit.ly/1wqcChS
  [powerline-install-webpage]: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
  [hack-font-webpage]: http://sourcefoundry.org/hack/

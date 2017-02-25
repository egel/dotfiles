```
 ____  __    ____  _         ___   ___  _____  ____  _   _     ____  __
| |_  / /`_ | |_  | |       | | \ / / \  | |  | |_  | | | |   | |_  ( (`
|_|__ \_\_/ |_|__ |_|__     |_|_/ \_\_/  |_|  |_|   |_| |_|__ |_|__ _)_)
```

[![Build Status](https://travis-ci.org/egel/dotfiles.svg?branch=master)](https://travis-ci.org/egel/dotfiles)
[![MIT LICENSE](http://img.shields.io/badge/license-MIT-yellowgreen.svg?style=square)](https://github.com/egel/dotfiles/blob/master/LICENSE)
[![Stories in Ready](https://badge.waffle.io/egel/dotfiles.svg?label=ready&title=Ready)](http://waffle.io/egel/dotfiles)

> Personal dotfiles configurator for Arch, Ubuntu 16.04 & Mac OSX.

* * *
[Installation](#installation) | [Update](#update) | [Learn more on Wiki][dotfiles-wiki] | [Shortcuts Cheat Sheet (PDF)][shortcuts-cheat-sheet]
* * *
**Sample screenshots for desktop theme**. See [gallery][wiki-gallery] for more.

<img src="http://i.imgur.com/WBaOs30.png" title="Tmux with friends - Git + dircolors + vim + 256color test" width="430" />
<img src="http://i.imgur.com/fBkmExR.png" title="GUI Vim (MacVim)" width="430" />

> Used gruvbox terminal pallete, [see more][wiki-terminal-pallete].


## Why you should try it?
Personalization of your tools has never been so easy, pleasant and quick to set.
This tool allow you to manage your dotfiles configuration in more intuitive and
secure way with ability to creating a backup of your fragile data.

If you want to test it, feel free to run built-in [Dockerfile](https://github.com/egel/dotfiles/blob/master/Dockerfile).

```shell
$ mkdir testdotfiles && cd testdotfiles && wget https://github.com/egel/dotfiles/blob/master/Dockerfile
$ docker build -t egel/dotfiles:latest .
$ docker run -it egel/dotfiles:latest
root@1a911f5d10c2:/# dotfiles --help
```

Enjoy !

## Features

This set contains configuration for:
-   **[ZSH][zsh-webpage]** shell (oh-my-zsh)
-   **[Git][git-webpage]** (account management, aliases)
-   **[Vim][vim-webpage]**
-   **[Tmux][tmux-webpage]** (key-bindings, copy-paste to system clipboard)
-   **[Mutt][mutt-webpage]** (themes, secured passwords)
-   **[EditorConfig][editorconfig-webpage]**
-   **[Conky][conky-webpage]** (only for Linux)
-   **[Virtualenvwrapper][virtulenvwrapper-webpage]

Configurator features
-   Easy to set your personal configuration/theme
-   Change themes in seconds
-   Create backups in seconds
-   Intuitive and comfortable keybindings with [online cheatsheet][shortcuts-cheat-sheet]
-   and much more inside


## Installation
Installer will install `dotfiles` program globally in your system, that you can
use it wherever you like.

> Don't be afraid, **installation process won't remove any of your previous
> configurations**. It will only save them all, simply by renaming files with
> current date.

> If you want to agree to all defaults add `-y` flag at the end of install.

Installation types:
*   With github account
    ```shell
    $ git clone --recursive git@github.com:egel/dotfiles.git ~/.dotfiles
    $ ~/.dotfiles/bin/dotfiles install
    ```

*   Without github account
    ```shell
    $ git clone --recursive https://github.com/egel/dotfiles.git ~/.dotfiles
    $ ~/.dotfiles/bin/dotfiles install
    ```

When you pass through the installation, you should have `dotfiles` program
globally installed, then run:

```shell
$ dotfiles clean-all
$ dotfiles reconfigur
```

The last thing you should do is to set [`Hack font`][hack-font-webpage] as
default `terminal` and/or `guake` font. This is essential to correctly display
powerline fonts already included into the Hack font (Read [FAQ][wiki-faq] for
more).

Reopen the terminal and enjoy :)


## Update
To update repository and its submodules

```shell
$ dotfiles update
```

## Learn more
To find further information about this project, take a look at [wiki
pages][dotfiles-wiki] and [shortcuts cheat sheet][shortcuts-cheat-sheet].

  [dotfiles-wiki]: https://github.com/egel/dotfiles/wiki
  [wiki-gallery]: https://github.com/egel/dotfiles/wiki/Gallery
  [wiki-faq]: https://github.com/egel/dotfiles/wiki/FAQ-(Frequently-Asked-Questions)
  [wiki-terminal-pallete]: https://github.com/egel/dotfiles/wiki/FAQ-(Frequently-Asked-Questions)#terminal-color-pallete-gruvbox
  [shortcuts-cheat-sheet]: http://bit.ly/1wqcChS
  [powerline-install-webpage]: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
  [hack-font-webpage]: http://sourcefoundry.org/hack/
  [mutt-webpage]: http://www.mutt.org/
  [tmux-webpage]: https://tmux.github.io/
  [vim-webpage]: http://www.vim.org/
  [git-webpage]: https://git-scm.com/
  [zsh-webpage]: http://www.zsh.org/
  [editorconfig-webpage]: http://editorconfig.org/
  [conky-webpage]: https://github.com/brndnmtthws/conky
  [virtulenvwrapper-webpage]: https://virtualenvwrapper.readthedocs.io/en/latest/


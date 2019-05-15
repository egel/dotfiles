```
 ____  __    ____  _         ___   ___  _____  ____  _   _     ____  __
| |_  / /`_ | |_  | |       | | \ / / \  | |  | |_  | | | |   | |_  ( (`
|_|__ \_\_/ |_|__ |_|__     |_|_/ \_\_/  |_|  |_|   |_| |_|__ |_|__ _)_)
```

[![Build Status](https://travis-ci.org/egel/dotfiles.svg?branch=master)](https://travis-ci.org/egel/dotfiles)
[![MIT LICENSE](http://img.shields.io/badge/license-MIT-yellowgreen.svg?style=square)](https://github.com/egel/dotfiles/blob/master/LICENSE)

> Personal dotfiles configurator for Arch, Ubuntu 16.04 & Mac OSX.

---

[Installation](#installation) | [Update](#update) | [Learn more in Docs][dotfiles-docs] | [Shortcuts Cheat Sheet (PDF)][shortcuts-cheat-sheet]

---

**Sample screenshots**

<img src="https://github.com/egel/dotfiles/blob/master/docs/assets/dotfiles_screenshot.png" title="Tmux, git, vim into 256 color terminal" />

> Used gruvbox pallete for [tmux](https://github.com/egel/tmux-gruvbox), [vim](https://github.com/morhetz/gruvbox) and terminal with [Hack font][hack-font-webpage].

## Why you should try it?

Personalization of your tools has never been so easy, pleasant and quick to set.
This tool allow you to manage your dotfiles configuration in more intuitive and
secure way with ability to creating a backup of your fragile data.

```shell
$ docker run -it egel/dotfiles:latest /bin/bash
```

## Features

This set contains configuration for:

-   **[BASH][bash-webpage]/[ZSH][zsh-webpage]** shell (oh-my-zsh)
-   **[Git][git-webpage]** (account management, aliases)
-   **[Vim 8][vim-webpage]**
-   **[Tmux][tmux-webpage]** (key-bindings, copy-paste to system clipboard)
-   **[Mutt][mutt-webpage]** (themes, secure passwords)
-   **[EditorConfig][editorconfig-webpage]**
-   **[Virtualenvwrapper][virtulenvwrapper-webpage]**

Configurator features

-   Easy to set your personal configuration
-   Create backups in seconds
-   Intuitive and comfortable keybindings with [online cheatsheet][shortcuts-cheat-sheet]
-   and much more inside

## Installation

Installer will install `dotfiles` program globally in your system, that you can
use it wherever you like.

> Don't be afraid, **installation process won't remove any of your previous
> configurations**. It will only save them all, simply by renaming files with
> current date.

If you want to agree to all defaults add `-y` flag at the end of install.

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
default `terminal` font. This is essential to correctly display
a powerline fonts which are already included into the Hack font (Read
[FAQ][docs-faq] for more).

Reopen the terminal and enjoy.

## Update

To update a repository and its submodules

```shell
$ dotfiles update
```

## Learn more

To find further information about this project, take a look at [docs
pages][dotfiles-docs] and [shortcuts cheat sheet][shortcuts-cheat-sheet].

[dotfiles-docs]: https://github.com/egel/dotfiles/blob/master/docs/index.md
[docs-faq]: https://github.com/egel/dotfiles/tree/master/docs/faq
[shortcuts-cheat-sheet]: http://bit.ly/1wqcChS
[hack-font-webpage]: http://sourcefoundry.org/hack/
[mutt-webpage]: http://www.mutt.org/
[tmux-webpage]: https://tmux.github.io/
[vim-webpage]: http://www.vim.org/
[git-webpage]: https://git-scm.com/
[zsh-webpage]: http://www.zsh.org/
[bash-webpage]: https://www.gnu.org/software/bash/
[editorconfig-webpage]: http://editorconfig.org/
[virtulenvwrapper-webpage]: https://virtualenvwrapper.readthedocs.io/en/latest/


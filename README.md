# dotfiles

![GitHub Release](https://img.shields.io/github/v/release/egel/dotfiles)
![GitHub License](https://img.shields.io/github/license/egel/dotfiles)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/egel/dotfiles)
![GitHub repo size](https://img.shields.io/github/repo-size/egel/dotfiles)

> Personal dotfiles configuration for macOS & Linux Ubuntu.

[Shortcuts Cheat Sheet (PDF)][shortcuts-cheat-sheet] | [Configs][docs-configurations] | [Assets][docs-assets]

<img src="docs/assets/demo-screenshot_x1600.avif" alt="tmux, git, nvim, ls that all into 256 color terminal" />

> Used gruvbox palette for [tmux](https://github.com/egel/tmux-gruvbox), [vim](https://github.com/morhetz/gruvbox) and terminal with [Hack font][hack-font-webpage].

## Highlights

ZSH with [oh-my-zsh][weblink-oh-my-zsh], git with separate private & work profiles, tmux with gruvbox theme, LSP-ready Neovim, and 30+ other tool configs: all symlinked from a single repository.

## Quick start

Everything here lives in the repository and is connected to your home directory with symlinks, so any change in the repo is instantly live. For details and alternatives, see the [configuration guide][docs-configurations].

```sh
# 1. clone the repository
git clone https://github.com/egel/dotfiles.git ~/.dotfiles

# 2. export the root path (add the same line to ~/.zshrc)
export DOTFILES_DIR="$HOME/.dotfiles"

# 3. link the shell configuration
ln -sf ${DOTFILES_DIR}/configuration/.zshrc ${HOME}/.zshrc

# 4. open a new shell and follow the configuration guide
```

Requirements: [zsh](https://www.zsh.org/) as your shell, [oh-my-zsh][weblink-oh-my-zsh], and [git][weblink-git] >= 2.13. macOS is the primary target, Linux Ubuntu is supported too.

## What's inside

The full list of configurations with per-tool setup steps lives in the [configuration guide][docs-configurations]. Here is the map:

| Tool                  | Description                                                                 |
| --------------------- | --------------------------------------------------------------------------- |
| zsh                   | Shell setup with aliases, fzf completion, and private per-machine overrides |
| git                   | Private & work profiles, git-delta diffs, LFS, commit templates             |
| tmux                  | Session config with gruvbox theme for macOS & Linux                         |
| neovim                | LSP, linters, formatters, battle-tested, GUI overlay included               |
| ghostty / alacritty   | Terminal emulators                                                          |
| fzf                   | Fuzzy finder with tab completion                                            |
| ssh                   | Multi-host guidance for personal, work, and client setups                   |
| gnupg                 | GPG keys, signing, and encrypted passwords                                  |
| mutt                  | Console e-mail client for Gmail                                             |
| vscode / idea         | Editor settings                                                             |
| gvim / sublime-text-3 | Legacy editor configs                                                       |

Version managers: [brew][weblink-brew] (Brewfile), [gvm][weblink-gvm] (Go), [nvm][weblink-nvm] (Node), [pyenv][weblink-pyenv] (Python), [rbenv][weblink-rbenv] (Ruby), and [rustup][weblink-rustup] (Rust).

## Removal

Since all files are symlinks, removing them is as simple as deleting the links. To list all symlinks pointing into this repo:

```sh
find ~ -type l -lname "${DOTFILES_DIR}/*"
```

[shortcuts-cheat-sheet]: http://bit.ly/1wqcChS
[hack-font-webpage]: https://sourcefoundry.org/hack/
[docs-configurations]: ./configuration/README.md
[docs-assets]: ./assets/README.md
[weblink-git]: https://git-scm.com/
[weblink-oh-my-zsh]: https://ohmyz.sh/
[weblink-brew]: https://brew.sh/
[weblink-gvm]: https://github.com/moovweb/gvm
[weblink-nvm]: https://github.com/nvm-sh/nvm
[weblink-pyenv]: https://github.com/pyenv/pyenv
[weblink-rbenv]: https://github.com/rbenv/rbenv
[weblink-rustup]: https://rust-lang.org/tools/install/

# Configuration

This document is meant for explain how to configure available features/programs.

> [!IMPORTANT]
> All configurations are based on downloaded repository to localhost, and using symlinks connect files from the repository.
>
> I prefer this approach as it allow me to quickly update my configuration files when they changes and update my main repository.
>
> If you prefer to copy files instead due to e.g.: security reasons, feel free to do so.

> [!NOTE]
> I use a custom keybindings for the configuration in this folder. If you're interested see [my keybindings cheatsheet][shortcuts-cheatsheet].
>
> In daily work I heavily rely on nvim used inside tmux sessions while using TKL keyboard types, so the configuration have most effective shortcuts for this particular combination.

> [!TIP]
> To avoid problems during setup, it's much saver to use absolute paths while creating symlinks.

## zsh

| type | Shell |
| ---- | ----- |

```bash
ln -sf ${PWD}/.zshrc ${HOME}/.zshrc
ln -sf ${PWD}/.zshenv ${HOME}/.zshenv
ln -sf ${PWD}/.zprofile ${HOME}/.zprofile
```

### shell personal config

Optional.

> [!TIP]
> File `.zshrc.private` is excluded from accidental committing in this repo.

```
touch ~/.
```

### shell aliases

I use aliases to modify behavior of some programs or add new useful shortcuts:

```bash
# public aliases
ln -sf ${PWD}/.aliases ${HOME}/.aliases
```

### shell private passwords

In case you may need private passwords accessible on shell level.

> [!TIP]
> File `.passwords.private` is excluded from accidental committing in this repo.

> [!DANGER]
> Do not store here any critical passwords!

```bash
# create your private passwords accessible on shell level
touch ~/.envpass.private

# make sure only you can manage the file
chmod 600 ~/.envpass.private
```

## git

Requirements:

- `git` >= 2.13
- [`git-lfs`][weblink-git-lfs]
- [`git-delta`][weblink-git-delta]

Git configuration for multiple users (private/personal & work) to conveniently separate your private projects from the work.

- git large files support
- multiple git users support
- large git repository support (see 'maintenance' section in related .gitconfig file)
- better git diffs using git-delta
- optional: global gitignore to ignore

```bash
# link main configuration
ln -sf ${PWD}/.gitconfig ${HOME}/.gitconfig

# link git-delta themes
ln -sf ${PWD}/.git-delta-themes ${HOME}/.git-delta-themes

# copy config for personal/private account (root dir ~/privatespace)
cp -sf ${PWD}/.gitconfig.private ${HOME}/.gitconfig.private
# your private projects may need certain custom rules while committing messages
cp -sf ${PWD}/.gitmessage.private

# copy config for work account (root dir ~/workspace)
cp -sf ${PWD}/.gitconfig.work ${HOME}/.gitconfig.work
# some jobs have certain, custom rules while committing messages
cp -sf ${PWD}/.gitmessage.work

# optional: add global gitignore file to ignore files from any repo
ln -sf ${PWD}/.gitignore_global ${HOME}/.gitignore_global
```

## fzf

| type | Search program |
| ---- | -------------- |

Fuzzy finder

> [!NOTE]
> Requirements:
>
> - oh-my-zsh

```bash
# install oh-my-zsh and then
git clone https://github.com/lincheney/fzf-tab-completion.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/fzf-tab-completion

ln -sf ${PWD}/.fzf.zsh ${HOME}/.fzf.zsh
```

## SSH

> [!TIP]
> SSH is generally very private space. To keep it clean use protected directory to load your ssh configurations for each personal, or clients/servers, like in the example below:
>
> - ~/.ssh/config.d/personal
> - ~/.ssh/config.d/client1
> - ~/.ssh/config.d/client2

It's good to add below settings to your `~/.ssh/config`

```sshconfig
# Include additional configuration files
Include config.d/*
```

Secure your configuration files & directories:

```bash
# main ssh directory
chmod 700 ~/.ssh/
# public keys
chmod 644 ~/.ssh/**/*.pub
# private keys
chmod 644 <set manually each file>
# authorized keys
chmod 644 ~/.ssh/authorized_keys
# configurations
chmod 600 ~/.ssh/config/
```

## gvm

| type | Version Manager |
| ---- | --------------- |

Go version manager - <https://github.com/moovweb/gvm>.

I tend using many versions of Golang. This package manager helps me to use desired version based on project needs and switch them in fly.

```
$ which go
/Users/johndoe/.gvm/gos/go1.21.6/bin/go
```

### Alternatively go via brew

If you do not care or use single go version you can install it via brew, or other package manager.
I add sample configuration below for better reference:

```bash
#########################################
# Golang
#########################################
export GOPATH=$HOME/go
case $(uname -s) in
  Darwin)
    export GOROOT="$(brew --prefix golang)/libexec"
    ;;
  Linux)
    export GOROOT=$HOME/go-1.20.0
    ;;
esac
if [[ $PATH != *"go"* && -d "$GOPATH" && -d "$GOROOT" ]]; then
  export PATH=$PATH:$GOPATH/bin # additional go libraries
  export PATH=$PATH:$GOROOT/bin # path of go source
fi
```

## nvim

| type | Text Editor |
| ---- | ----------- |

Neovim - <https://github.com/neovim/neovim>

> [!NOTE]
> Installation is trivial, but to have a complete, full working nvim configuration you may need to install some additional programs.
>
> To install them I use some popular package managers (e.g.: brew, nvm, gvm, rbenv). Configuration for them you can also find here.

> [!TIP]
>
> The full key-binding configuration can be found in [Shortcuts Cheatsheet][shortcuts-cheatsheet]

```bash
makedir -p ${HOME}/.config/
ln -sf ${PWD}/.config/nvim ${HOME}/.config/nvim
```

- Open nvim and install plugins `:Lazy` ([Lazy nvim](https://github.com/folke/lazy.nvim) package manager)
- Some plugin may require additional programs to install. You can check it all via `:checkhealth` command.
  - I use my brew (`Brewfile`) and npm (`npm.global.txt`) configuration files to install some additional programs used to properly run all nvim features (especially for lsp and linters).

```bash
go install mvdan.cc/gofumpt@latest
go install golang.org/x/vuln/cmd/govulncheck@latest
go install github.com/abenz1267/gomvp@latest
```

## vim

| type | Text Editor |
| ---- | ----------- |

> [!WARNING]
> I do not anymore actively plan to work/enhance my vim configuration. I switched to nvim as daily driver.

## nvm

| type | Version Manager |
| ---- | --------------- |

Node package manager - <https://github.com/nvm-sh/nvm>

### npm global packages

If you using different versions of node, it might be useful for you to persist same global packages available when switching to different node versions.

Install my personal list of global npm packages:

```bash
npm install -g $(<configuration/npm.global.txt)
```

#### List all global packages or add new?

- list all global packages (when using `nvm` this apply to active version)

  ```bash
  npm list -g --depth=0
  ```

- add new package with sample command below (or simply edit the file manually):

  ```bash
  # append sample mynewpackage to end of file
  echo "mynewpackage@1.0.0" >> configuration/npm.global.txt
  ```

### yarn

> [!NOTE]
>
> `yarn` is related/bound to the Node version, therefore I always install it via global npm package.

```bash
npm install -g yarn

$ which yarn
/Users/johndoe/.nvm/versions/node/v20.11.0/bin/yarn
```

> [!TIP]
> If you do not care how , you can install it via brew (info it will be bound to your local node version, possibly latest). Below simple config for `.zshrc`:
>
> ```bash
> #########################################
> # Yarn
> #########################################
> export PATH="$(yarn global bin):$PATH"
> ```

## rbenv

| type | Version Manager |
| ---- | --------------- |

Ruby environments - <https://github.com/rbenv/rbenv>

```bash
brew install rbenv

# Display list of all possible versions"
rbenv install --list

# install (example with 2.7.7)
rbenv install -v 2.7.7
rbenv global 2.7.7

# add if not have already in .zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc

# check ruby
$ which ruby
/Users/johndoe/.rbenv/shims/ruby

# check version
$ ruby -v
ruby 2.7.7p221 (2022-11-24 revision 168ec2b1e5) [arm64-darwin22]
```

## pyenv

| type | Version Manager |
| ---- | --------------- |

```bash
brew instal pyenv

# pyenv install --list   # list all available python versions to install
pyenv install 3.11.6

# setup global version
$ pyenv global 3.11.6

# test if global version is setup correctly
$ pyenv global
3.11.6

# test if using correct python
$ which python
/Users/myuser/.pyenv/shims/python

$ python --version
Python 3.11.6
```

#### python global packages

> [!NOTE]
> When using many different python versions (or switch between them often) there is a need to persist come global packages that serve the need for other programs.
>
> The list below contains some packages that are used by other programs (e.g.: linters, checkers)

```bash
python install -r python.global.txt
```

[shortcuts-cheatsheet]: http://bit.ly/1wqcChS
[weblink-git-lfs]: https://git-lfs.com/
[weblink-git-delta]: https://github.com/dandavison/delta

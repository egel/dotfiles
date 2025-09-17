# Configuration

This document is meant to explain how to configure available features/programs.

> [!IMPORTANT]
> All configurations are based on downloaded repository to localhost, and using symlinks connect files from the repository.
>
> I prefer this approach as it allows me to quickly update my configuration files when they change and update my main repository.
>
> If you prefer to copy files instead due to e.g.: security reasons, feel free to do so.

> [!NOTE]
> I use custom keybindings for the configuration in this folder. If you're interested see [my keybindings cheatsheet][shortcuts-cheatsheet].
>
> In daily work I heavily rely on nvim used inside tmux sessions while using TKL keyboard types, so the configuration has the most effective shortcuts for this particular combination.

> [!TIP]
> To avoid problems during setup, it's much safer to use absolute paths while creating symlinks.

## zsh

| type | Shell |
| ---- | ----- |

```bash
ln -sf ${PWD}/.zshrc ${HOME}/.zshrc
ln -sf ${PWD}/.zshenv ${HOME}/.zshenv
ln -sf ${PWD}/.zprofile ${HOME}/.zprofile
```

Install [oh-my-zsh](https://ohmyz.sh/#install)

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### shell personal configs

(Optional) Sometimes you want to separate some personal configuration from being commited to repo. With the personal configs you can add some configuration that will also be collected but never commited to the repository.

> [!TIP]
> File `.zshrc.private` or `.zshrc.work` are excluded from accidental committing in this repo.

```
# private config
touch ~/.zshrc.private

# work-related only config
touch ~/.zshrc.work
```

### shell aliases

I use aliases to modify the behavior of some programs or add new useful shortcuts:

```bash
# public aliases
ln -sf ${PWD}/.aliases ${HOME}/.aliases
```

### shell private passwords

In case you may need private passwords accessible on the shell level.

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
cd configuration

# link main configuration
ln -sf ${PWD}/.gitconfig ${HOME}/.gitconfig

# link git-delta themes
ln -sf ${PWD}/.git-delta-themes ${HOME}/.git-delta-themes

# copy config for personal/private account (root dir ~/privatespace)
cp -sf ${PWD}/.gitconfig.private ${HOME}/.gitconfig.private
# your private projects may need certain custom rules while committing messages
cp -sf ${PWD}/.gitmessage.private ${HOME}/.gitmessage.private

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
> SSH is generally a very private space. To keep it clean use a protected directory to load your SSH configurations for each personal, or clients/servers, like in the example below:
>
> - ~/.ssh/config.d/personal
> - ~/.ssh/config.d/work
> - ~/.ssh/config.d/client1
> - ~/.ssh/config.d/client2

It's good to add the below settings to your `~/.ssh/config`

```sshconfig
# Include additional configuration files
Include config.d/*
```

> [!TIP]
> The sample files in ssh/config.d directory could look like
>
> ```init
> # ~/.ssh/config.d/personal
>
> # Default github
> Host me.github.com
>     HostName github.com
>     PreferredAuthentications publickey
>     IdentityFile ~/.ssh/me_rsa
>
> # vi: ft=sshconfig
> ```
>
> ```init
> # ~/.ssh/config.d/work
>
> # Work github
> Host work.github.com
>     HostName github.com
>     PreferredAuthentications publickey
>     IdentityFile ~/.ssh/work_rsa
>
> # vi: ft=sshconfig
> ```

Then if you want to pull and push as some specific user then set the git remote url to desired user. More you can find here [Specify an SSH key for git push for a given domain](https://stackoverflow.com/a/7927828/1977012)

```bash
# before modification print current remote
git remote -v

git remote add work git@work.github.com:whatever.git
git remote add me git@me.github.com:whatever.git
```

Secure your configuration files & directories with proper rights:

```bash
# main ssh directory
chmod 700 ~/.ssh
# public keys
chmod 644 ~/.ssh/**/*.pub
# private keys
chmod 600 <set manually each file>
# authorized keys
chmod 600 ~/.ssh/authorized_keys
# known hosts
chmod 644 ~/.ssh/known_host
# configurations
chmod 600 ~/.ssh/config
```

## alacritty

fast and simple terminal emulator (currently under test, if I like it)

```bash
ln -sf ~/privatespace/github.com/egel/dotfiles/configuration/.config/alacritty ~/.config/alacritty
```

## gvm

| type | Version Manager |
| ---- | --------------- |

Go version manager - <https://github.com/moovweb/gvm>.

I tend to use many versions of Golang. This package manager helps me to use the desired version based on project needs and switch them on the fly.

```bash
# show all available versions
$ go listall

# install and enable
$ go install go1.21.6
$ go use go1.21.6 --default # set default go version

# test if using correct version
$ which go
/Users/johndoe/.gvm/gos/go1.21.6/bin/go

# (optional) disable telemetry
go telemetry off
```

**Alternatively go via brew**

If you do not care or use a single `go` version, you can install it via brew, or other package managers.
I have added a sample configuration below for better reference:

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

### Go global packages

```sh
# protobuf
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# golint tools
go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest

# generate changelog from commits
go install github.com/golistic/xgo/cmd/changelog@latest
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
- Some plugins may require additional programs to install. You can check it all via `:checkhealth` command.
  - I use my brew (`Brewfile`) and npm (`npm.global.txt`) configuration files to install some additional programs used to properly run all nvim features (especially for lsp and linters).

```bash
go install mvdan.cc/gofumpt@latest
go install golang.org/x/vuln/cmd/govulncheck@latest
go install github.com/abenz1267/gomvp@latest
```

### Ollama

local LLM model.

to work on macOS requires an App from <https://github.com/ollama/ollama>

```bash
# install ollama
brew install ollama

# install small model
ollama pull codellama:7b  # nvim is already configured to use this model
```

## vim

| type | Text Editor |
| ---- | ----------- |

> [!WARNING]
> I do not anymore actively plan to work/enhance my vim configuration. I switched to nvim as a daily driver.

## nvm

| type | Version Manager |
| ---- | --------------- |

Node package manager - <https://github.com/nvm-sh/nvm>

### npm global packages

If you using different versions of nodes, it might be useful for you to persist the same global packages available when switching to different node versions.

Install my personal list of global npm packages:

```bash
npm install -g $(<configuration/npm.global.txt)
```

#### List all global packages or add new ones?

- list all global packages (when using `nvm` this applies to the active version)

  ```bash
  npm list -g --depth=0
  ```

- add a new package with the sample command below (or simply edit the file manually):

  ```bash
  # append sample mynewpackage to end of file
  echo "mynewpackage@1.0.0" >> configuration/npm.global.txt
  ```

### yarn

> [!NOTE]
>
> `yarn` is related/bound to the Node version, therefore I always install it via the global npm package.

```bash
npm install -g yarn

$ which yarn
/Users/johndoe/.nvm/versions/node/v20.11.0/bin/yarn
```

> [!TIP]
> If you do not care how, you can install it via brew (info it will be bound to your local node version, possibly the latest). Below simple config for `.zshrc`:
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
/Users/johndoe/.pyenv/shims/python

$ python --version
Python 3.11.6
```

#### python global packages

> [!NOTE]
> When using many different python versions (or switching between them often) there is a need to persist come global packages that serve the need for other programs.
>
> The list below contains some packages that are used by other programs (e.g.: linters, checkers)

```bash
python install -r python.global.txt
```

## mutt

Console e-mail client

> config is for Gmail, if you use a different client please adapt the config

```bash
# install mutt client
brew install mutt

# enter config dir
cd configuration

# link config files
ln -sf ${PWD}/.mutt/ ${HOME}/.mutt
ln -sf ${PWD}/.muttrc ${HOME}/.muttrc

# copy template with private variables and adjust
cp ${PWD}/.configuration/.muttrc.private ${HOME}/.muttrc.private
```

## GPG / PGP

### Install GPG configs

```bash
mkdir -p ${HOME}/.gnupg

ln -sf ${PWD}/.gnupg/dirmngr.conf ${HOME}/.gnupg/dirmngr.conf
ln -sf ${PWD}/.gnupg/gpg-agent.conf ${HOME}/.gnupg/gpg-agent.conf
ln -sf ${PWD}/.gnupg/gpg.conf ${HOME}/.gnupg/gpg.conf

# make sure, the directory & contents belong to you:
chown -R $(whoami) ~/.gnupg/

# correct access rights for .gnupg and subfolders:
find ~/.gnupg -type f -exec chmod 600 {} \;
find ~/.gnupg -type d -exec chmod 700 {} \;
```

### import own gpg key

- you should have your `privatekey` and `publickey.pub`.

```bash
gpg --import privatekey
```

After importing if you try to sign commits all should work but when you check the repository for `git log --show-signature` then you may see something like:

```
commit 5a0fafb301f549e1277ca3b2fb92a8c141659ea2
gpg: Signature made Wed Sep  4 09:36:32 2024 CEST
gpg:                using RSA key 247A19A21F71CFD6F02AC05E10BC01ED9FF2F5BA
gpg: Good signature from "John Doe <johndoe@gmail.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 247A 19A2 1F71 CFD6 F02A  C05E 10BC 01ED 9FF2 F5BA
Author: John Doe <johndoe@gmail.com>
Date:   Wed Sep 4 09:36:32 2024 +0200

    feat: add command to list all tags

...
```

This tells that if you have your own key it would be good to increase trust level. To do so just edit your key trust level by:

```bash
# show keys with full long key-id
gpg --list-secret-keys --keyid-format LONG

# edit
gpg --edit-key [key-id]

trust

5 # as ultimate trust

quit
```

Now it you check the signature you should see:

```
commit 5a0fafb301f549e1277ca3b2fb92a8c141659ea2
gpg: Signature made Wed Sep  4 09:36:32 2024 CEST
gpg:                using RSA key 247A19A21F71CFD6F02AC05E10BC01ED9FF2F5BA
gpg: Good signature from "John Doe <johndoe@gmail.com>" [unknown]
Primary key fingerprint: 247A 19A2 1F71 CFD6 F02A  C05E 10BC 01ED 9FF2 F5BA
Author: John Doe <johndoe@gmail.com>
Date:   Wed Sep 4 09:36:32 2024 +0200

    feat: add command to list all tags

...
```

### Create new key

> [!TIP] Before creating a new key, you need to disable `no-tty` option from `~/.gnupg/gpg.conf`. This option blocks unwanted creations of new keys. To be safe, enable `no-tty` option backe again after the creation of a new key is completed.

> [!TIP] Remember to create a revocation certificate after.

```bash
gpg --full-gen-key
gpg: WARNING: unsafe permissions on homedir '/Users/johndoe/.gnupg'
gpg (GnuPG) 2.4.7; Copyright (C) 2024 g10 Code GmbH
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Please select what kind of key you want:
   (1) RSA and RSA
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
   (9) ECC (sign and encrypt) *default*
  (10) ECC (sign only)
  (14) Existing key from card
Your selection? 1
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (3072) 4096
Requested keysize is 4096 bits
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 5y
Is this correct? (y/N) y

GnuPG needs to construct a user ID to identify your key.

Real name: John Doe
Email address: johndoe@example.com
Comment: Acme Company
You selected this USER-ID:
    "John Doe (Acme Company) <johndoe@example.com>"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? o
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
gpg: directory '/Users/johndoe/.gnupg/openpgp-revocs.d' created
gpg: revocation certificate stored as '/Users/johndoe/.gnupg/openpgp-revocs.d/BJ7PJGBAHFIJ7ZV9GWONX2PTBDOFOA78UBN6R8ZE.rev'
public and secret key created and signed.

pub   rsa4096 2025-01-31 [SC]
      BJ7PJGBAHFIJ7ZV9GWONX2PTBDOFOA78UBN6R8ZE
uid                      John Doe (Acme Company) <johndoe@example.com>
sub   rsa4096 2025-01-31 [E]
```

BJ7PJGBAHFIJ7ZV9GWONX2PTBDOFOA78UBN6R8ZE

### create secure password

Requirements:

- gpg key configured (see previous sections for reference)

> How to set up a password app in Gmail? [Info link](https://support.google.com/accounts/answer/185833?hl=en)
>
> - Create a new App password: <https://myaccount.google.com/apppasswords>

```bash
# create temporary file with passwords
cat << EOF | tee -a ~/.mutt/passwords
set smtp_pass="XXXXXXX"
set imap_pass="XXXXXXX"
EOF

# update passwords
vim ~/.mutt/passwords

# see available keys
gpg --list-keys

# encrypt file with your gpg key
gpg -r johndoe@gmail.com -e ~/.mutt/passwords

# remove plain text file with password
rm ~/.mutt/passwords
```

open mutt

[shortcuts-cheatsheet]: http://bit.ly/1wqcChS
[weblink-git-lfs]: https://git-lfs.com/
[weblink-git-delta]: https://github.com/dandavison/delta

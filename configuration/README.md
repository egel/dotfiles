## Configuration

This document is meant for explain how to configure available features/programs.

INFO: I use a custom keybindings for the configuration in this folder. If you're interested see [my keybindings cheatsheet][shortcuts-cheat-sheet].

---

DISCLAIMER: All configurations are based on downloaded repository to localhost, and using symlinks connect files from the repository.

I prefer this approach as it allow me to quickly update my configuration files when they changes and update my main repository.

If you prefer to copy files instead due to e.g.: security reasons, feel free to do so.

---

HINTS:

- to avoid problems it's much saver to use absolute paths when symlinks.

### zsh

```bash
ln -sf ${PWD}/.zshrc ${HOME}/.zshrc
ln -sf ${PWD}/.zshenv ${HOME}/.zshenv
ln -sf ${PWD}/.zprofile ${HOME}/.zprofile
```

#### shell aliases

I use aliases to modify behavior of some programs or add new useful shortcuts:

```bash
# public aliases
ln -sf ${PWD}/.aliases ${HOME}/.aliases
```

### fzf

Requires:

- oh-my-zsh

```bash
# install oh-my-zsh and then
git clone https://github.com/lincheney/fzf-tab-completion.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/fzf-tab-completion

ln -sf ${PWD}/.fzf.zsh ${HOME}/.fzf.zsh
```

### SSH

SSH is generally very private space. To keep it clean use protected directory to load your personal ssh configurations for each of servers/clients:

- ~/.ssh/config.d/personal
- ~/.ssh/config.d/client1
- ~/.ssh/config.d/client2

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

### gvm

<https://github.com/moovweb/gvm>

I use many versions of Golang, this package helps me to use dedicated version based on project needs.

### nvim

INFO: installation is trivial, but to have complete, full working nvim configuration you may need to install some additional programs. To install them I use some popular package managers (e.g.: brew, nvm, gvm, rbenv). Configuration for them you can also find here.

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

### nvm & node & yarn

- INFO: `yarn` is related to node version, therefore I always install it via global npm package.

#### npm global packages

If you using different versions of node, it might be useful for you to persist same global packages available when switching to different node versions.

Install my personal list of global npm packages:

```bash
npm install -g $(<configuration/npm.global.txt)
```

##### List all global packages or add new?

- list all global packages (when using `nvm` this apply to active version)

  ```bash
  npm list -g --depth=0
  ```

- add new package with sample command below (or simply edit the file manually):

  ```bash
  # append sample mynewpackage to end of file
  echo "mynewpackage@1.0.0" >> configuration/npm.global.txt
  ```

[shortcuts-cheat-sheet]: http://bit.ly/1wqcChS

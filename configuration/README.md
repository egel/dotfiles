## Configuration

This document is meant for explain how to configure available features/programs.

INFO: I use a custom keybindings for the configuration in this folder. If you're interested see [my keybindings cheatsheet][shortcuts-cheat-sheet].

### fzf

Requires:

- oh-my-zsh

```bash
# install oh-my-zsh and then
git clone https://github.com/lincheney/fzf-tab-completion.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/fzf-tab-completion

ln -sf ${PWD}/.fzf.zsh ${HOME}/.fzf.zsh
```

### nvim

```bash
makedir -p ${HOME}/.config/
ln -sf ${PWD}/.config/nvim ${HOME}/.config/nvim
```

- Open nvim and install plugins `:PlugInstall`
- Some plugin may require additional programs to install. You can check it all via `:checkhealth` command.

go install mvdan.cc/gofumpt@latest
go install golang.org/x/vuln/cmd/govulncheck@latest
go install github.com/abenz1267/gomvp@latest

### SSH

SSH is generally very private space. To keep it clean use protected directory to load your personal ssh configurations
for each of servers/clients

- ~/.ssh/config.d/home
- ~/.ssh/config.d/client1

```sshconfig
# Include additional configuration files
Include config.d/*
```

### nvm & node & yarn

#### npm global packages

If you using different versions of node it might be important for you to persist
same global packages available when switching to different node versions.

Below I add my personal list of global packages I often use:

```bash
npm install -g \
  @angular/language-server \
  @cyclonedx/bom \
  corepack \
  jest \
  prettier \
  typescript-language-server \
  typescript \
  yarn
```


[shortcuts-cheat-sheet]: http://bit.ly/1wqcChS

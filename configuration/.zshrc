# INFO .zshrc
#
# [Read when interactive]
#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="clean"
ZSH_THEME="honukai"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow vi-mode kubectl colored-man-pages colorize tmux python npm yarn docker fzf)
autoload -U compinit && compinit

# Ignore ORIG_HEAD in zsh git autocomplete
zstyle ':completion:*:*' ignored-patterns '*ORIG_HEAD'

#########################################
# ZSH key-bindings (specyfic for OS)
#########################################
case $(uname -s) in
  Darwin)
    bindkey '^[.' insert-last-word # insert last word (Alt+.)
    ;;
  Linux)
    bindkey '\e.' insert-last-word # insert last word (Alt+.)
    ;;
esac
# universal
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward

#########################################
# Dotfiles: Add private aliases
#########################################
DOTFILES_ALIASES_PRIVATE=$HOME/.aliases.private
if [ -s "${DOTFILES_ALIASES_PRIVATE}" ]; then
  source ${DOTFILES_ALIASES_PRIVATE}
fi

DOTFILES_ALIASES_WORK=$HOME/.aliases.work
if [ -s "${DOTFILES_ALIASES_WORK}" ]; then
  source ${DOTFILES_ALIASES_WORK}
fi

alias vim='nvim'
alias v='nvim'
alias nvimdiff='nvim -d'
alias vimdiff='nvim -d'

#########################################
# Dotfiles: Load private passwords
#########################################
[ -s "$HOME/.envpass.private" ] && . "$HOME/.envpass.private"

#########################################
# Dotfiles: Load personal settings .zshrc.local
#########################################
DOTFILES_ZSH_LOCAL_FILE=$HOME/.zshrc.local
if [ -f "$DOTFILES_ZSH_LOCAL_FILE" ]; then
  source "$DOTFILES_ZSH_LOCAL_FILE"
fi

#########################################
# Additional programs (brew, mysql)
#########################################
case $(uname -s) in
  Darwin)
    # support brew installs
    if [[ $PATH != *"/usr/local/sbin"* && -d "/usr/local/sbin" ]]; then
      export PATH="/usr/local/sbin:$PATH"
    fi

    # export mysql (and its sub-programs)
    if [[ -d "/usr/local/mysql" && $PATH != *'mysql'* ]]; then
      export PATH="/usr/local/mysql/bin:$PATH"
    fi
    ;;
esac

#########################################
# Configure dircolors
#########################################
case $(uname -s) in
  Darwin)
    if whence dircolors >/dev/null; then
      eval "$(dircolors -b)"
      zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
    else
      export CLICOLOR=1
      zstyle ':completion:*:default' list-colors ''
    fi
    ;;
  Linux)
    if [ -d "~/.dircolors" ]; then
      eval $(dircolors ~/.dircolors)
      zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    fi
    ;;
esac

# for xfce4-terminal
if [[ "$COLORTERM" == "xfce4-terminal" ]]; then
  export TERM="xterm-256color"
fi;

#########################################
# Virtualenvwrapper
#########################################
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
DOTFILES_VIRTUALENVWRAPPER_FILE=$(which virtualenvwrapper.sh)
[ -s "$DOTFILES_VIRTUALENVWRAPPER_FILE" ] && source $DOTFILES_VIRTUALENVWRAPPER_FILE

#########################################
# NVM config
#########################################
# nvm installed from orginal nvm script
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# add current node (+ node programs installed globally) to PATH
# NOTE: nvm have to be installed & configured before to make it works
CURRENT_NODE_VERSION=$(node --version)
if [[ $PATH != *"nvm"* && -d "$HOME/.nvm" && $(find . -mindepth 1 -maxdepth 1 -type d | wc -l) ]]; then
  export PATH="$PATH:$HOME/.nvm/versions/node/$CURRENT_NODE_VERSION/bin"
elif [ ! -d "$HOME/.nvm" ]; then
  echo "Missing NVM (Node Version Manager)."
  echo "Visit https://github.com/nvm-sh/nvm to install it."
fi

#########################################
# SSH agent
#########################################
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

# If you enabled the SSH Agent Support, you also need to tell ssh about it
# by adding this to your init script
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

#########################################
# kubectl
#########################################
#completition from https://kubernetes.io/docs/reference/kubectl/cheatsheet/
[[ -f $(brew --prefix kubectl) ]] && source <(kubectl completion zsh)

#########################################
# Travis
#########################################
if [[ -f "$HOME/.travis/travis.sh" ]]; then
    source "$HOME/.travis/travis.sh"
fi

#########################################
# rbenv
#########################################
# Use local Ruby manager (rbenv) instead of system ruby version
if [ -d "$(brew --prefix rbenv)" ]; then
    eval "$(rbenv init -)"
fi

#########################################
# pyenv
#########################################
if [ -d "$(brew --prefix pyenv)" ]; then
    eval "$(pyenv init -)"
fi

## LLVM (CPP)
if [ -d "$(brew --prefix llvm)" ]; then
    export PATH="$(brew --prefix llvm)/bin:$PATH"
fi 

#########################################
# Rust / cargo programs
#########################################
if [[ -d "$HOME/.cargo/bin" ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

#########################################
# gvm
#########################################
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
# export GOROOT_BOOTSTRAP=$GOROOT

#########################################
# Fuzzy files finder
#########################################
[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"
#
# Ctrl + t -> open file finder
# Ctrl + r -> open last commands

#########################################
# sdkman (java version manager)
#########################################
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


#########################################
# Golang (installed via 'go install')
#########################################
export PATH="$HOME/go/bin:$GOPATH/bin:$PATH"

#########################################
# ALWAYS AT THE END
# oh-my-zsh.sh
#########################################
if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
else
  echo "Missing $ZSH/oh-my-zsh.sh file."
fi

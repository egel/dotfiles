# INFO
# This file should contain commands to set up aliases, functions,
# options, key bindings, etc.

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Case-sensitive completion.
CASE_SENSITIVE="false"

# How often to auto-update (in days).
export UPDATE_ZSH_DAYS=14

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
HIST_STAMPS="yyyy-mm-dd"

# Add wisely, as too many plugins slow down shell startup !!!
# NOTE: Do not load nvm for eslint (more info https://github.com/roadhump/SublimeLinter-eslint#plugin-installation)
plugins=(git git-flow colored-man-pages colorize tmux python npm yarn gulp zsh-syntax-highlighting zsh-completions docker docker-compose)
autoload -U compinit && compinit

# Ignore ORIG_HEAD in zsh git autocomplete
zstyle ':completion:*:*' ignored-patterns '*ORIG_HEAD'

case $(uname -s) in
  Darwin)
    if [[ $PATH != *"/usr/local/sbin"* && -d "/usr/local/sbin" ]]; then
      export PATH="/usr/local/sbin:$PATH"
    fi

    # GNUBIN_DIR="/usr/local/opt/coreutils/libexec/gnubin"
    # if [[ $PATH != *${GNUBIN_DIR}* && -d ${GNUBIN_DIR} ]]; then
      # export PATH="${GNUBIN_DIR}:$PATH"
    # fi

    # export mysql (and its sub-programs)
    if [[ -d "/usr/local/mysql" && $PATH != *'mysql'* ]]; then
      export PATH=$PATH:/usr/local/mysql/bin
    fi

    if [[ -d "/usr/local/sbin" && $PATH != *'/usr/local/sbin'* ]]; then
      export PATH="/usr/local/sbin:$PATH"
    fi
    ;;
esac

# Configure dircolors
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

# ZSH key-bindings
# specyfic for OS
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

# for xfce4-terminal
if [[ "$COLORTERM" == "xfce4-terminal" ]]; then
  export TERM="xterm-256color"
fi;

# Add private aliases
DOTFILES_PRIVATE_ALIASES=$HOME/.aliases.private
if [ -s "${DOTFILES_PRIVATE_ALIASES}" ]; then
  source ${DOTFILES_PRIVATE_ALIASES}
fi

# Virtualenvwrapper
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
DOTFILES_VIRTUALENVWRAPPER_FILE=$(which virtualenvwrapper.sh)
[ -s "$DOTFILES_VIRTUALENVWRAPPER_FILE" ] && source $DOTFILES_VIRTUALENVWRAPPER_FILE

# Node version manager config
#export NPM_CONFIG_PREFIX="/usr/local"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# Yarn
export PATH="$(yarn global bin):$PATH"

# add current node (+ node programs installed globally) to PATH
# NOTE: nvm have to be configured to works
CURRENT_NODE_VERSION=$(node --version)
if [[ $PATH != *"nvm"* && -d "$HOME/.nvm" ]]; then
  $PATH=$PATH':'$HOME'/.nvm/versions/node/'$CURRENT_NODE_VERSION'/bin'
elif [ ! -d "$HOME/.nvm" ]; then
  echo "Missing NVM (Node Version Manager)."
fi

# Golang
export GOPATH=$HOME/go-workspace
case $(uname -s) in
  Darwin)
    export GOROOT=/usr/local/opt/go/libexec
    ;;
  Linux)
    export GOROOT=$HOME/go-1.8.1
    ;;
esac

if [[ $PATH != *"go"* && -d "$GOPATH" && -d "$GOROOT" ]]; then
  export PATH=$PATH:$GOPATH/bin # additional go libraries
  export PATH=$PATH:$GOROOT/bin # path of go source
fi

# Load private passwords
[ -s "$HOME/.envpass.private" ] && . "$HOME/.envpass.private"

# Load personal .zshrc.local settings
DOTFILES_ZSH_LOCAL_FILE=$HOME/.zshrc.local
if [ -f "$DOTFILES_ZSH_LOCAL_FILE" ]; then
  source "$DOTFILES_ZSH_LOCAL_FILE"
else
  echo "Missing $HOME/.zshrc.local. It might some .dotfiles ZSH settings will not be available."
  echo "To fix this run: '$HOME/.dotfiles/bin/dotfiles -r; source $HOME/.zshrc'"
fi

# Added by travis gem
if [ -f $HOME/.travis/travis.sh ]; then
  source $HOME/.travis/travis.sh
fi

# ALWAYS AT THE END
# Load oh-my-zsh.sh if exist
if [[ -f $ZSH/oh-my-zsh.sh ]]; then
  source $ZSH/oh-my-zsh.sh
else
  echo "Missing $ZSH/oh-my-zsh.sh file."
fi

# Start SSH agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

#########################################
# GPG, GPG-agent
#########################################
# It is important to set the environment variable GPG_TTY in your login shell
export GPG_TTY="$(tty)"

# If you enabled the Ssh Agent Support, you also need to tell ssh
# about it by adding this to your init script
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

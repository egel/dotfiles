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
plugins=(git git-flow colored-man-pages colorize tmux python npm gulp zsh-syntax-highlighting)

# User configuration
export PATH="$PATH:$HOME/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

case $(uname -s) in
  Darwin)
    # export mysql (and its sub-programs)
    if [ -d "/usr/local/mysql" ]; then
      export PATH=/usr/local/mysql/bin:$PATH
    fi
    ;;
esac

# Load oh-my-zsh.sh if exsist
if [[ -f $ZSH/oh-my-zsh.sh ]]; then
  source $ZSH/oh-my-zsh.sh
else
  echo "Missing $ZSH/oh-my-zsh.sh file."
fi

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

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Add public aliases
DOTFILES_COMMON_ALIASES=$HOME/.aliases
[ -s "$DOTFILES_COMMON_ALIASES" ] && source $DOTFILES_COMMON_ALIASES

# Add private aliases
DOTFILES_PRIVATE_ALIASES=$HOME/.aliases.private
[ -s "$DOTFILES_PRIVATE_ALIASES" ] && source $DOTFILES_PRIVATE_ALIASES

# Virtualenvwrapper
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
DOTFILES_VIRTUALENVWRAPPER_FILE=/usr/local/bin/virtualenvwrapper.sh
[ -s "$DOTFILES_VIRTUALENVWRAPPER_FILE" ] && source $DOTFILES_VIRTUALENVWRAPPER_FILE

# Node version manager config
#export NPM_CONFIG_PREFIX="/usr/local"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

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

source $ZSH/oh-my-zsh.sh


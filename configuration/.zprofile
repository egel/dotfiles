# brew: add support for brew when starting
eval "$(/opt/homebrew/bin/brew shellenv)"

# python: initialize pyenv
eval "$(pyenv init --path)"

# apps: add opt/local for consuming/adding local applications to PATH
export PATH="/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH"


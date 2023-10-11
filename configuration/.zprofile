eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(pyenv init --path)"

# Add opt/local for adding local applications
export PATH="/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH"


# INFO
# This file should contain commands to set the command search path, plus other
# important environment variables. `.zshenv' should not contain commands that
# produce output or assume the shell is attached to a tty.

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Set default shell
export SHELL=/bin/zsh

# Note that in the default coreutils installation, all GNU utilities will be
# prefixed with g. So, you'd use gls instead of ls.
# You can override that behavior by adding them to your path.
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

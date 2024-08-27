# INFO .zshenv
#
# [Read every time]
#
# This file should contain commands to set the command search path, plus other
# important environment variables. `.zshenv' should not contain commands that
# produce output or assume the shell is attached to a tty.

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Set default shell
export SHELL=/bin/zsh

#########################################
# GPG, GPG-agent
#########################################
# It is important to set the environment variable GPG_TTY in your login shell
export GPG_TTY="$(tty)"


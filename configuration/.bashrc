# export TERM="xterm-256color"

# Ctrl-s hang terminal emulator?
# relates to: http://unix.stackexchange.com/questions/72086/ctrl-s-hang-terminal-emulator
stty -ixon


# added by travis gem
[ -f /home/maciej/.travis/travis.sh ] && source /home/maciej/.travis/travis.sh

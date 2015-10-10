#!/bin/bash

SESSION="dotfiles"
FOLDER=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) # directory of this file

#create detached session named $SESSION
tmux new-session -d -s $SESSION
tmux splitw -h -p 50 -t 0
tmux splitw -v -p 50 -t 0
tmux splitw -v -p 50 -t 1

tmux selectp -t 0
tmux send-keys "$FOLDER/shell_colors.sh" 'C-m'

tmux selectp -t 1
tmux send-keys "cd $FOLDER && git lg" 'C-m'
#tmux send-keys "q"

tmux selectp -t 2
tmux send-keys "cd $FOLDER/../ && la" 'C-m'

tmux selectp -t 3
tmux send-keys "cd $FOLDER/../ && vim README.md" 'C-m'

tmux -2 attach-session -t $SESSION

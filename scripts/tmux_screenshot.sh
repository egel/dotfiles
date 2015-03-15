#!/bin/bash

SESSION="egel-dot-files"
FOLDER="~/dot-files" # or set ~/workspace/some

tmux new-session -d -s $SESSION
tmux splitw -h -p 50 -t 0
tmux splitw -v -p 50 -t 0
tmux splitw -v -p 50 -t 1

tmux selectp -t 0
tmux send-keys "$FOLDER/scripts/shell_colors.sh" 'C-m'

tmux selectp -t 1
tmux send-keys "cd $FOLDER && git lg" 'C-m'
tmux send-keys "q"

tmux selectp -t 2
tmux send-keys "cd $FOLDER && la" 'C-m'

tmux selectp -t 3
tmux send-keys "cd $FOLDER && vim README.md" 'C-m'

tmux -2 attach-session -t $SESSION

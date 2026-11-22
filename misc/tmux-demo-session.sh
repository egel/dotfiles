#!/usr/bin/env bash
#
# Create a reusable tmux demo window, ready for screenshots.
#
# Usage:
#   tmux-demo-session.sh [--attach] [--name NAME] [--dir PATH]
#
#   --attach    attach to the session right away (default: stay detached)
#   --name      session name (default: "demo")
#   --dir       working directory for the panes (default: $DOTFILES_DIR or $HOME)
#
# The session can be recreated at any time with:
#   tmux kill-session -t demo && tmux-demo-session.sh --attach

set -euo pipefail

SESSION="demo"
ATTACH=0
DIR="${DOTFILES_DIR:-$HOME}"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --attach) ATTACH=1; shift ;;
    --name) SESSION="$2"; shift 2 ;;
    --dir) DIR="$2"; shift 2 ;;
    *)
      echo "unknown option: $1" >&2
      exit 1
      ;;
  esac
done

# Fresh session: drop any previous one with the same name.
tmux kill-session -t "$SESSION" 2>/dev/null || true

# Layout: 2 columns; left column has 2 panes, right column has 2 panes.
tmux new-session -d -s "$SESSION" -c "$DIR"
tmux split-window -h -p 50 -t "$SESSION:0.0"
tmux split-window -v -p 50 -t "$SESSION:0.0"
tmux split-window -v -p 50 -t "$SESSION:0.1"

# Pane content. Pane 0 gets the shell color palette demo when available.
PANE0="$DIR"
if [[ -n "${DOTFILES_DIR:-}" && -f "$DOTFILES_DIR/misc/shell_colors.sh" ]]; then
  PANE0="$DOTFILES_DIR/misc/shell_colors.sh"
fi

tmux send-keys -t "$SESSION:0.0" "$PANE0" C-m
tmux send-keys -t "$SESSION:0.1" "cd '$DIR' && git lg" C-m
tmux send-keys -t "$SESSION:0.2" "cd '$DIR' && ls -A" C-m
tmux send-keys -t "$SESSION:0.3" "cd '$DIR'" C-m
tmux send-keys -t "$SESSION:0.3" "vim README.md 2>/dev/null || $SHELL" C-m

# Give the commands a moment to render, then focus the first pane.
sleep 1
tmux select-pane -t "$SESSION:0.0"

if [[ "$ATTACH" -eq 1 ]]; then
  tmux attach-session -t "$SESSION"
else
  echo "session '$SESSION' is ready: tmux attach-session -t $SESSION"
fi

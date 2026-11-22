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
    --attach)
      ATTACH=1
      shift
      ;;
    --name)
      SESSION="$2"
      shift 2
      ;;
    --dir)
      DIR="$2"
      shift 2
      ;;
    *)
      echo "unknown option: $1" >&2
      exit 1
      ;;
  esac
done

# Fresh session: drop any previous one with the same name.
tmux kill-session -t "$SESSION" 2>/dev/null || true

# Window 1 "overview": 2 columns; left column has 2 panes, right column has 2.
# tmux prints the pane ID (e.g. %5) for each created pane, so the script never
# depends on window/pane indexes or the base-index setting.
PANE0=$(tmux new-session -d -P -F '#{pane_id}' -s "$SESSION" -c "$DIR")
tmux rename-window -t "$PANE0" "overview"
PANE1=$(tmux split-window -h -P -F '#{pane_id}' -p 50 -t "$PANE0")
PANE2=$(tmux split-window -v -P -F '#{pane_id}' -p 50 -t "$PANE0")
PANE3=$(tmux split-window -v -P -F '#{pane_id}' -p 50 -t "$PANE1")

# Pane content. First pane gets the shell color palette demo when available.
PANE0_CMD="$DIR"
if [[ -n "${DOTFILES_DIR:-}" && -f "$DOTFILES_DIR/misc/shell_colors.sh" ]]; then
  PANE0_CMD="$DOTFILES_DIR/misc/shell_colors.sh"
fi

tmux send-keys -t "$PANE0" "$PANE0_CMD" C-m
tmux send-keys -t "$PANE1" "cd '$DIR' && glol" C-m
tmux send-keys -t "$PANE2" "cd '$DIR' && ls -al" C-m
tmux send-keys -t "$PANE3" "cd '$DIR'" C-m
tmux send-keys -t "$PANE3" "vim README.md 2>/dev/null || $SHELL" C-m

# Give the commands a moment to render, then focus the first pane.
sleep 1
tmux select-pane -t "$PANE0"

# Window 2 "next": a plain shell for live typing during the demo. The
# "overview" window stays open in the background.
tmux new-window -t "$SESSION:" -n "next" -c "$DIR"
tmux select-window -t "$PANE0"

if [[ "$ATTACH" -eq 1 ]]; then
  tmux attach-session -t "$SESSION"
else
  echo "session '$SESSION' is ready: tmux attach-session -t $SESSION"
fi

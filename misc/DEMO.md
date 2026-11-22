# Demo / screenshot setup

Helpers to prepare a clean, beautiful tmux stage for taking screenshots
(for example the one used in the root `README.md`).

## Recreate the demo window anywhere (recommended)

`misc/tmux-demo-session.sh` is the maintained, portable version of the stage,
kept separate from the symlinked configuration files.

Run it via the `DOTFILES_DIR` variable (exported by `.zshrc`):

```sh
# create (or recreate) the session and attach to it
${DOTFILES_DIR}/misc/tmux-demo-session.sh --attach
```

### Optional: make it available on `$PATH`

To run it as a plain command (`tmux-demo-session.sh --attach`), symlink it
into a directory on your `$PATH`, for example `/usr/local/bin`:

```sh
# one-time setup on a new laptop
ln -sf ${DOTFILES_DIR}/misc/tmux-demo-session.sh ${HOME}/.dotfiles-misc-tmux-demo-session

# then simply run
~/.dotfiles-misc-tmux-demo-session --attach
```

Options:

```sh
--name NAME   session name (default: demo)
--dir PATH    working directory for the panes (default: $DOTFILES_DIR)
--attach      attach immediately
```

To recreate a fresh stage at any time (for example after messing with the
panes):

```sh
tmux kill-session -t demo && ${DOTFILES_DIR}/misc/tmux-demo-session.sh --attach
```

The layout and pane contents are defined in one place: edit the
`tmux split-window` / `tmux send-keys` lines at the bottom of the script to
change what the demo shows.

## Legacy: bin/extras/tmux_screenshot.sh

The original helper `bin/extras/tmux_screenshot.sh` builds a demo tmux session
ready to be captured:

- creates a detached session named `dotfiles`
- splits the window into 4 panes
- fills each pane with demo content:
  - pane 0: runs `shell_colors.sh` (terminal color palette)
  - pane 1: `git lg` log output
  - pane 2: file listing (`ls -A`) of the dotfiles directory
  - pane 3: opens `README.md` in vim
- attaches to the session so you can take a screenshot of the window

Usage:

```sh
bin/extras/tmux_screenshot.sh
```

Then capture the tmux window with your usual macOS screenshot tool
(`Cmd+Shift+4`, then `Space` to capture the window).

Notes:

- `bin/` is deprecated, so this script is a legacy one-off helper. Prefer
  `misc/tmux-demo-session.sh` on new machines.
- The script expects `shell_colors.sh` to sit next to it in `bin/extras/`.
- To reuse the stage later, the session stays alive after detaching:

```sh
tmux attach -t dotfiles
```

## Prepare the macOS desktop for a clean demo

Hide everything that draws attention away from the terminal window.

### Hide Desktop folders and files (temporarily)

macOS renders the Desktop contents via Finder. Turning off "CreateDesktop"
gives you an empty desktop without deleting anything.

```sh
# hide desktop icons
defaults write com.apple.finder CreateDesktop -bool false
killall Finder
```

Revert after the demo:

```sh
# show desktop icons again
defaults write com.apple.finder CreateDesktop -bool true
killall Finder
```

### Hide desktop widgets (temporarily)

macOS Sonoma and later can show widgets on the desktop. Hide them via
WindowManager defaults:

```sh
# hide widgets on the desktop (and in Stage Manager)
defaults write com.apple.WindowManager StandardHideWidgets -bool true
defaults write com.apple.WindowManager StageManagerHideWidgets -bool true
killall Dock
```

Revert after the demo:

```sh
# show widgets on the desktop again
defaults write com.apple.WindowManager StandardHideWidgets -bool false
defaults write com.apple.WindowManager StageManagerHideWidgets -bool false
killall Dock
```

Alternative without the terminal: System Settings, Desktop & Dock, and turn
"Show Widgets" off (remember to turn it back on after the demo).

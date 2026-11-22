# Demo screenshot setup

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

## Optimize the screenshot with bir

Once you have the raw screenshot (macOS saves it as a heavy PNG), shrink it
with [bir](https://github.com/egel/bir), my Bulk Image Resizer. It is a single
self-contained Rust binary with ImageMagick baked in, so nothing else to
install.

Install it once with cargo:

```sh
cargo install --git https://github.com/egel/bir
```

Then convert the screenshot to AVIF, which keeps the terminal text sharp while
making the file tiny, perfect for a README:

```sh
# single file, longest side 1600 px, quality 60
bir screenshot.png -r 1600 -f avif -q 60

# outputs land next to the source as screenshot_x1600.avif
```

If you keep all demo screenshots in a folder, convert the whole folder at once:

```sh
bir ./screenshots -r 1600 -f avif -q 60 -o ./ready
```

AVIF encodes a bit slower than WebP but compresses much better and tolerates
lower quality well, so `-q 60` is a good starting point. Re-running is safe:
previous outputs are detected and skipped.

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

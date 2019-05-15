# FAQ - Terminal

## Why I have wrong characters in my terminal (Vim/Tmux)

1.  Set a terminal font which has **powerline fonts** support, e.g.: [Hack font](https://sourcefoundry.org/hack/) (the hack font should be automatically installed during the installation of dotfiles).

    **Mac OSX**

    <a href="docs/assets/set-terminal-font-for-mac.png"><img src="/docs/assets/set-terminal-font-for-mac.png" title="Set terminal font for Mac OSX" width="300" /></a>

    **Linux**

    <a href="/docs/assets/set-terminal-font-for-linux.png"><img src="/docs/assets/set-terminal-font-for-linux.png" title="Set terminal font for Linux" width="300" /></a>

## Fix the default terminal key-mapping

1.  Enable "Use Option as Meta Key"
1.  Fix the default behaviour of OSX terminal key mapping `Ctrl` + `<arrow keys>`:
    -   `Ctrl` + `←` map to: `\033[1;5D`
    -   `Ctrl` + `↑` map to: `\033[1;5A`
    -   `Ctrl` + `→` map to: `\033[1;5C`
    -   `Ctrl` + `↓` map to: `\033[1;5B`

<a href="/docs/assets/fix-key-mapping-in-default-osx-terminal.png"><img src="/docs/assets/fix-key-mapping-in-default-osx-terminal.png" title="OSX terminal key-mapping" width="300" /></a>

## Terminal color palette (Gruvbox)

For OSX there is a nice repository <https://github.com/flipxfx/gruvbox-terminal>

<a href="/docs/assets/osx-terminal-gruvbox-theme.png"><img src="/docs/assets/osx-terminal-gruvbox-theme.png" title="Default Mac OSX terminal palette" width="300" /></a>

For Linux distributions I've made simple mirror of Gruvbox colors in the default Linux terminal. Use some color picker (ex: [gcolor2](http://gcolor2.sourceforge.net/)) to get same results.

<a href="/docs/assets/gruvbox-terminal-palette-in-linux.png"><img src="/docs/assets/gruvbox-terminal-palette-in-linux.png" title="Gruvbox terminal palette in Linux" width="300" /></a>

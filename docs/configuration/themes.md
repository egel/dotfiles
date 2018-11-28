# Theme customization

1. Install [dotfiles][egel-dotfiles] on you machine.

1. Now you can edit every `*.local` file related to desired program configuration - only exception is configuration for vim (~/.vimrc) Files are stored into `~/.dotfiles/configuration` directory or after `dotfiles --reconfigure` you can also edit symlink directly from your home directory (`~/`).
    > **Good to know**: `.vimrc.local` extends `.vimrc`, so when you want to override some general settings you probably want to put it into the related `*.local` file, because those I usually loaded at the end of basic configuration file.

    - Vim `~/.dotfiles/configuration/.vimrc` - search configuration object (`s:settings`) that define multiple vim settings (including themes) like i.e: type of background (dark/light), background color, theme name and many more.
    - Tmux `~/.dotfiles/configuration/.tmux.conf.local`
    - Mutt `~/.dotfiles/configuration/.mutt/.muttrc.local`
    - ZSH `~/.dotfiles/configuration/.zshrc.local`

1. Reopen your programs

Enjoy a new theme configuration!

[egel-dotfiles]: https://github.com/egel/dotfiles

# Theme customization

## Updating default themes

1.  Install [dotfiles][egel-dotfiles] on you machine.
1.  Edit the desired configuration to new one.
1.  Reopen terminal

Enjoy a new theme configuration!

## How the themes works?

Most of programs have their default configuration files, but some of them also have additional configuration file which usually ends with `*.local` postfix. Those files should be specific to your local system configuration. For example: at home you're using most of the time an English localization variable, but your configuration at work must be localized to the other place - those local files should be the place to help you .

> There are some programs (e.g.: Vim) which current configuration makes it difficult (unwise or inefficient) to have additional `*.local` file.

The tracked configuration files (in the repository) are stored in `~/.dotfiles/configuration` directory. After executing `dotfiles --reconfigure` command you configuration files are symlinked to their default destination directories, exactly where are expected by the programs.

**Good to know**: There is a schema of using the `*.local` files. The `.local` file always extends default configuration, so when you want to override some general settings you probably want to put it in the `*.local` file, because those local files are always loaded near the end of their basic configuration files.

## Configuration files

### Vim

| Settings                | Value                                                            |
| :---------------------- | :--------------------------------------------------------------- |
| Main configuration file | [`~/.dotfiles/configuration/.vimrc`](../../configuration/.vimrc) |

Search a configuration object (`s:settings`) which defines multiple vim settings (including themes) e.g.:

-   theme name
-   background color
-   preferred type of background (dark/light)
-   airline theme

### Tmux

| Settings                 | Value                                                                                |
| :----------------------- | :----------------------------------------------------------------------------------- |
| Main configuration file  | [`~/.dotfiles/configuration/.tmux.conf`](../../configuration/.tmux.conf)             |
| Local configuration file | [`~/.dotfiles/configuration/.tmux.conf.local`](../../configuration/.tmux.conf.local) |

Install your favourite theme via:

-   [TPM](https://github.com/tmux-plugins/tpm)
-   or manually by pasting a theme directly at the end of configuration file

### Mutt

| Settings                | Value                                                              |
| :---------------------- | :----------------------------------------------------------------- |
| Main configuration file | [`~/.dotfiles/configuration/.muttrc`](../../configuration/.muttrc) |

### ZSH

| Settings                 | Value                                                                        |
| :----------------------- | :--------------------------------------------------------------------------- |
| Main configuration file  | [`~/.dotfiles/configuration/.zshrc`](../../configuration/.zshrc)             |
| Local configuration file | [`~/.dotfiles/configuration/.zshrc.local`](../../configuration/.zshrc.local) |

[egel-dotfiles]: https://github.com/egel/dotfiles

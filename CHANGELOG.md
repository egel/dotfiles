# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- dotfiles/OSX: Added Brewfile - the configuration file for brew (#98)
- CI-CD: Added shellcheck linter (#122)
- dotfiles: refactor installing ZSH theme

### Changed
- Switch neobundle plugin manager in favor of simpler vim-plug (#65)
- Replace NeoComplete with YouCompleteMe code-completion engine (#127)
- Upgrade vim installation from source files (#120)
- Vim: Moved from Syntastic to Vim-ALE linter (#134)
- dotfiles: Refactor internals of dotfiles configurator (#142)

### Deprecated
### Removed
### Fixed
- Fix missing Brefile, .gemrc and .mdlrc when cleaning dotfiles (#131)

### Security

## [2.4.0] - 2018-12-30
### Added
- Github: Add basic templates for Github
- IntelliJ: Add vim-surround support for IntelliJ
- Tmux/TPM: load the tmux-gruvbox theme via TPM (#113)
- Tmux: Add Tmux Plugin Manager (#97)
- Vim: Add EditorConfig to OSX brew installer
- Vim: Add ctrlp plugin for vim
- Vim: Add new spell words
- Vim: Add new words for EN vim spell
- Vim: Add new words to vim spell for EN
- Vim: Add some obvious restriction to not have so many issues especially with angular HTML templates in Syntastic
- Vim: Add unused_vim_plugins and unused_vim_settings as backup
- Vim: Showing hidden files in ctrlp plugin
- ZSH/oh-my-zsh: Add zsh-completions to .zshrc plugins
- ZSH: Add .zshenv and move important variables into it
- ZSH: Add yarn plugin to .zshrc
- dotfiles/Vim: Add linter configuration for markdown and .gemrc config file (#109)
- dotfiles: Add core utilities for OSX
- dotfiles: Add missing changelog file
- dotfiles: Add missing sbin to OSX/brew/ZSH configuration
- dotfiles: Add shunit2 bash testing framework v2.1.6 as a submodule
- dotfiles: Add unit test environment for main bash configurator
- dotfiles: Cover few sample methods in dotfiles configurator with unit tests
- dotfiles: Move wiki inside the repository (#112)

### Changed
- Tmux: Update Linux key bindings for Tmux v2.4
- Tmux: Update Tmux key binding to v2.4
- Vim  Ignore some obvious folders i.e.: node_modules, SVN, git, idea (from IntelliJ)
- Vim: Improve highlighting Nginx syntax for default site-available and site-enabled locations
- Vim: NERDTree increase a default size of the sidebar to 40
- Vim: Remove fix size of the console when open vim
- Vim: Set auto highlight on search and improve keybinding command
- Vim: Set relative numbers on a side
- ZSH: Fix showing command not found compdef
- dotfiles/Vim: Fix coping from system clipboard for OSX
- dotfiles: Improve Dockerfile to run Egel's dotfiles on Ubuntu 16.04
- dotfiles: Improve README with simpler docker setup
- dotfiles: Improve symlinking into the configurator
- dotfiles: Improvement patch mostly with visual and pattern recognition changes
- dotfiles: Install fonts from local font assets (#102)
- dotfiles: Minor updates to help option
- dotfiles: Move Dockerfile to dockerhub.com for simpler and quicker usage

### Deprecated
- Vim: NERDTree disable open sidebar when open vim or vim with empty content

### Removed
- dotfiles: Remove unnecessary print commands
- dotfiles: Remove tabs (retab)

### Fixed
- Tmux: Fix Tmux invalid or unknown command bind-key -t vi-copy
- Vim: Fix some typos in comments

### Security
- dotfiles: Improve permissions for files and directories

## [2.3.0] - 2017-02-19
### Added
- IntelliJ/Vim: Add .ideavimrc
- Vim: Add new words for spell checking
- dotfiles/Git: Add gitconfig for work account
- dotfiles: Add support Linux Xenial
- dotfiles: Add support for Arch Linux
- dotfiles: Add Travis program from ruby gems
- dotfiles: Add Trusty OS & OSX

### Changed
- Git/ZSH: Improved ignoring ORIG_HEAD in ZSH Git auto complete
- dotfiles: Improve installation variables for OSX
- dotfiles: Update OSX Travis image to xcode8
- dotfiles: Upgrade dircolors-solarized and honuka-iterm-zsh submodules to latest versions

### Fixed
- Vim: Add language tag to snippet for Palican article
- dotfiles/Terminal: Fix source vitrualenvwrapper.sh
- dotfiles: Fix not symlinked files while reconfigure

### Deprecated
- dotfiles: Multiple themes will be replaced with the singular configurable default theme

## [2.2.3] - 2016-12-07
### Added
- Vim: Add new words for en
- ZSH: Add Golang support for ZSH
- Vim: Add NeoComplete
- Vim: Add vim snippets
- Vim: Add vim unused_plugins

### Changed
- Git/ZSH: Disable a group of git aliases in favor of oh-my-zsh
- Vim: Change font size 11
- Vim: Disable mapping to enter vim ex mode
- Vim: Improve vim markdown support
- Vim: Syntastic checkers for go, sass, typescript

### Removed
- Vim: Remove eslint from default JS linting
- dotfiles: Remove legacy eval docker machine for Mac OSX

### Fixed
- Documentation: Add terminal color palette info
- Git: Unlock basic aliases
- dotfiles/Vim: Rename .vimrc.local to .vimrc.theme due to this name will be used to per-project settings of vim
- Tmux: add Cmus alias preventing from hanging app when open
- Tmux: Tmux pane & window index from 0 to 1
- Vim: Add description of core plugins
- Vim: Add a plugin for Golang
- Vim: Add plugins for Scala, FastFold, snippets
- Vim: Add typescript plugins
- Vim: Add vim-sass-lint plugin
- Vim: Change loading vim.local to vim.theme
- Vim: Default markdown indent from 2 to 4
- Vim: Disable annoying visual bell for GUI vim
- Vim: Disable default fold in favor of FastFold plugin
- Vim: Move unused plugins into unused_plugins
- Vim: Personal vim spell
- Vim: Update installation for vim 8.0
- dotfiles: Update default .dotfiles.config file
- dotfiles: Add common .bashrc file

## [2.2.2] - 2016-08-22
### Fixed
- Node/Vim: Nvm/Node in global PATH for gvim/macvim
- dotfiles: Remove old symlinks in favor of DRY
- dotfiles: Update images into the README

## [2.2.1] - 2016-08-21
- dotfiles/extras: Fix paths for files into Tmux screenshot script
- dotfiles: Fix bug Shellcheck SC2086 with git-dir & git-tree
- dotfiles: Fix of dotfiles program regarding sh and Shellcheck

## [2.2.0] - 2016-08-11
### Added
- Vim: Add gitgutter signs
- Vim: Improve vim spell
- dotfiles/Vim: add Shellcheck to installation process

### Changed
- Tmux: Gruvbox dark replaced current Tmux color scheme
- Tmux: Remove Tmuxline snapshots in favor to dedicated Tmux themes
- Vim: Improve opening time of Vim and related plugins and now it depends on filetype
- Vim: Improve python3 support for Vim/MacVim
- Vim: Improve vim install from source files for Linux

### Fixed
- Git: Add few new aliases and rename few for EN
- Tmux: Fix typos
- Vim: Add new words to vim spell
- dotfiles/Tmux: Upgrade tmux-gruvbox submodule
- dotfiles/Tmux: Add tmux-gruvbox submodule
- dotfiles/Tmux: Fix typo into tmux-gruvbox submodule name
- dotfiles/Vim: Fix syntax errors
- dotfiles: Reorder loading files and set xterm as default

## [2.1.1] - 2016-06-14
### Added
- Git: Add auto vim spell while gitcommit
- Tmux: Add tmux.vim syntax
- Vim: syntastic symbols and json checker
- Vim: vim-json set syntax
- dotfiles/Git: Exclude gmailcerts
- dotfiles/Vim: Add muttrc vim filetype

### Changed
- Tmux: Change airline theme for Gruvbox
- Tmux: Disable move line up/down key-bindings
- Tmux: Gather airline settings together
- Tmux: Improve Tmux key-binding for Mac OSX and Linux
- Tmux: Improve setup Tmux configuration
- Vim: Toggle force spelling

### Remove
- Vim: Remove force setting *.jade

### Fixed
- Vim: Disable auto buffers due to vim-fugitife errors
- dotfiles/terminal: Bug with loading ZSH theme during starting terminal
- dotfiles: Fix indentation in few places
- dotfiles: Fix typos

## [2.1.0] - 2016-06-08
- Mutt: Exclude mutt cache/ and passwords.gpg
- Vim: Add new words for spell checking for En lang
- dotfiles: Fix typo
- dotfiles: Move muttrc to .mutt config directory

### Security
- Mutt: Improve generating secure Mutt GPG password for dotfiles

## [2.0.2] - 2016-03-03
### Changed
- dotfiles/documentation: Update README
- Vim: Improve Vim spell
- dotfiles/Vim: Move vimrc theme settings to sepatate files

### Fixed
- dotfiles: Fix typos
- dotfiles: Improve dockerfile

## [2.0.1] - 2016-03-03
### Added
- Sublime: Add sublime text 3 config + key bindings
- Tmux: Enable keybindings for moving lines up/down
- Vim: Add .gvimrc
- Vim: Add .gvimrc to NERDTree highlight
- Vim: Add .gvimrc
- Vim: Add CSS colors preview for gui
- Vim: Add few plugins
- Vim: Add goyo plugin
- Vim: Add missing tabular plugin for vim-markdown
- Vim: Add ngdoc for markdown syntax
- Vim: Add vim-localvimrc settings
- Vim: Add words to spell
- Vim: Improve files colors in NERDTree
- Vim: Sort order A-Z
- ZSH: Add honukai ZSH theme
- dotfiles/Git: Add large files storage filter
- dotfiles/ZSH: Add symlinking honukai zsh theme to installer
- dotfiles: Add backup option
- dotfiles: Add description for backup option
- dotfiles: Add eslint
- dotfiles: Add fixing personal files and directories
- dotfiles: Add make symlink for .gvimrc
- dotfiles: Add ubuntu trusty beta
- dotfiles: Add Vim colors script

### Changed
- EditorConfig: Reduce .editorconfig
- Tmux: Update airline plugins
- Vim: Add slack + webapi plugins
- Vim: Merge JSON syntax
- Vim: Move and improve settings for vim-indent-guides plugin
- Vim: Move loading .vimrc.local at end of vim configuration
- Vim: Update .vimrc.local
- Vim: Update closing vim if NERDTree is last
- Vim: Update Vim spell
- ZSH: Move SSH settings + default lang from .zshrc to .zshrc.local
- dotfiles/ZSH: Improve loading oh-my-zsh
- dotfiles/documentation: Update README.md
- dotfiles: Change default desktop ZSH theme to honukai
- dotfiles: Condence description
- dotfiles: Enable auto reload ~/.vimrc on save
- dotfiles: Enable update of repository during the installation
- dotfiles: Move Linux EditorConfig to new install command
- dotfiles: Move loading zshrc.local at the end

### Fixed
- Tmux: Fix keybinding for jumping lines up/down
- Vim: Fix installation of vim plugins by moving reconfigure task
- Vim: Improve descriptions of vim plugins
- Vim: Improve highlighting TODO, FIXME, NOTE etc
- Vim: Improve set font
- Vim: Improve setup GUI interface
- Vim: Improve syntastic plugin
- Vim: Improve tablabels GUI/LUI
- Vim: Improve vim colors
- Vim: Improve vim spell
- Vim: Improve vim-indent-guides
- Vim: Improve vim-markdown settings
- Vim: Increase undo history
- Vim: Hide lines for NERDTree
- Vim: Improve GUI window size
- Vim: Improve set GUI interface
- Vim: Improve set of vim encodings
- dotfiles: Fix `update` command
- dotfiles: Fix add shellslash for win users
- dotfiles: Fix indenting
- dotfiles: Fix typos
- dotfiles: Improve auto reload of vim config files

### Removed
- Tmux: Remove unused Tmux themes
- Vim: Add Vim spell for en.utf-8
- Vim: Reduce comments
- Vim: Remove duplicate package
- Vim: Remove highlight matching braces
- Vim: Remove Nginx syntax in favor of auto loaded plugin
- Vim: Remove unused code
- Vim: Remove unused packages
- Vim: Remove vim-slack plugin
- Vim: Set force JSON syntax for .eslintrc
- dotfiles/tests: Resign from beta ubuntu trusty for Travis
- dotfiles: Remove commented backup for vim

## [2.0.0] - 2016-02-25
### Added
- dotfiles: Add export enUS for mac virtualenvwrapper
- dotfiles: Add MySQL directory to PATH
- dotfiles: Add shell encode
- dotfiles: Add sort method key binding; fix folding
- dotfiles: Exclude .DS_Store files

### Changed
- Vim: Improve folding and fix the order of few parts
- Vim: Improve vim keybindings
- dotfiles/ZSH: Improve aliases for Linux and Mac
- dotfiles/ZSH: Improve bindkey for mac
- dotfiles: Improve install configurator for mac
- dotfiles: restructure method definitions

### Deprecated
- Vim/markdown: Disable vim-json conceal (quotes glitching)

### Removed
- dotfiles: Remove useless exit 1

### Fixed
- Tmux: Update mouse settings for Tmux 2.1
- Vim: Update font and window size for GUI
- ZSH: Fix ZSH plugin names
- dotfiles: Fix integer expression expected
- dotfiles: Fix missing print_subsection while calling in other methods
- dotfiles: Fix unary operator expected
- dotfiles: Update dircolors library

## [1.5.0] - 2016-01-04
### Added
- Vim: Add vim-monokai, vimproc
- Vim: Improve doc styling with folding
- Vim: Improve folding
- dotfiles: Add Travis config file
- dotfiles: Add `-y` flag to take default values for all questions and proceed without interaction
- dotfiles: Add a default for GPG install
- dotfiles: Add build badge
- dotfiles: Add default to all during install
- dotfiles: Add force change to master during update dotfiles
- dotfiles: Add language
- dotfiles: Add missing apt-add-repository program
- dotfiles: Add reboot question for defaults
- dotfiles: Add sample Dockerfile config for Ubuntu 14.04
- dotfiles: Add sudo when the admin permission is required
- dotfiles: Exclude .vim/tmp

### Changed
- dotfiles: Move before NeoBundleCheck
- dotfiles: Update README

### Deprecated
- Vim: Disable vim backups

### Fixed
- dotfiles: Fix boolean if statements
- dotfiles: Fix temporary directories
- dotfiles: Fix to install NeoBundle silently
- dotfiles: Improve first install NeoBundle
- dotfiles: Improve install NeoBundle
- dotfiles: Improve install with pre-build defaults
- dotfiles: Update with HTTP protocol

## [1.4.4] - 2016-01-02
### Added
- Vim: Add Nginx syntax
- Vim: Add monokai colorscheme
- Vim: Add nerdtree file colors
- ZSH/oh-my-zsh: Add nvm plugin
- dotfiles: Add auto installation of vim plugins

### Changed
- Vim: Use SaveSession instead of mksession
- Vim: Segregate plugins
- Update dircolors-solarized lib
- dotfiles: Update and minified egel logo

## [1.4.3] - 2015-10-24
### Fixed
- dotfiles: Fix project path to logo
- dotfiles: Update dircolors-solarized lib

## [1.4.2] - 2015-10-16
### Added
- Vim: Add nerdtree-git-plugin
- Vim: Add NERDTreeFind key map for indicators
- Vim: Add open NERDTree when open vim
- Vim: Close NERDTree when leaving vim
- Vim: How hidden files by default
- dotfiles: Add check status and question user to copy default configuration  while installation
- dotfiles: Add waffle.io badge
- dotfiles: Exclude wiki folder

### Fixed
- dotfiles/documentation: Update README file
- dotfiles: Update dircolors-solarized library
- dotfiles: Update themes paths for .tmux.conf.local
- dotfiles: Fix paths for .TmuxlineSnapshot
- dotfiles: Update README.md for installation and update process
- dotfiles: Improve copying dotfiles configuration file

## [1.4.1] - 2015-10-10
### Fixed
- dotfiles: Update and refresh Linux's system fonts

## [1.4.0] - 2015-10-10
### Added
- Vim: Add pelican plugin
- Vim: Add open NERDTree on startup by default
- ZSH: Add nvm support for .zshrc
- dotfiles/Linux: Add fontconfig to required programs

### Changed
- Mutt: Add mutt config prompt during installation
- dotfiles: Fix defaults values for configurator's prompts
- dotfiles: Fix mistakenly moved fonts
- dotfiles: Fix running dotfiles configurator with its absolute path
- dotfiles: Fix shell var syntax
- dotfiles: Improve paths into .zshrc
- dotfiles: Move additional scripts to extras
- dotfiles: Move dotfiles program to bin directory
- dotfiles: Move server and desktop to themes dir

### Removed
- dotfiles: Remove unused scripts/files

### Fixed
- Mutt: Fix config GPG for mutt
- dotfiles: Improve loading virtualenvwrapper and public/private aliases
- dotfiles: Fix few typos

## [1.3.3] - 2015-09-12
### Added
- Vim: Add new plugin vim-gnupg
- Vim: Add sample own vim color definitions

### Changed
- documentation: Improve README file with installation/update process
- dircolors/Terminal: Update dircolors-solarized submodule repository
- Mutt: Improve Mutt configuration for Gmail accounts (with English menu language)
- Vim: Set Hack font size 10 as default GUI Vim font
- Vim: Set super tab completion for Ctrl-N
- Vim: Improve displaying markdown files
- ZSH/oh-my-zsh: add gulp plugin
- dotfiles: Improve creating symlinks while `reconfigure` command
- dotfiles: Improve `update` command

### Removed
- dotfiles: Remove shred, GPG from Ubuntu installation
- dotfiles: Remove flag notation for main commands has been removed

### Fixed
- Vim: Fix switching tabs with F7 & F8 keys
- Tmux: Updated snapshots of `.TmuxlineSnapshot` for server/desktop theme
- dotfiles: Fix powerline fonts
- dotfiles: Fix minor typos

## [1.3.2] - 2015-08-07
### Changed
- Mutt: Improve `make-mutt-password` command

### Security
- Mutt: Hide password while setting it up in `make-mutt-password` command

## [1.3.1] - 2015-08-07

### Added
- Mutt: Add additional flag command `-mmp` for triggering generating Mutt password

### Changed
- Mutt: Change name of the command for generating Mutt password to `--make-mutt-password`

## [1.3.0] - 2015-08-07
### Added
- Mutt: Add .muttrc and .muttrc.local config files (Mutt)
- Mutt: Add solarized theme (Mutt)
- Terminal/Vim: Add support of 256colors for xfce4-terminal

### Changed
- Docs: Update documentation in README file
- Tmux: Improve tmuxline preset

### Security
- Mutt: Improve generating secure password

## [1.2.1] - 2015-08-01
### Changed
- dotfiles: Rename main configurator to "dotfiles"
- dotfiles: Improve help command

## [1.2.0] - 2015-08-01
### Added
- Vim: Add personal settings for Vim
- dotfiles: Add project logo
- Vim: Add Jinja2, dockerfile, conkyrc plugins
- Vim: Add NeoBundle update and install method
- dotfiles: Add version command
- EditorConfig: Add .editorconfig file
- ZSH: Add virtualenvwrapper
- Tmux: Add Tmuxline default theme
- ZSH: Add inserting last word
- ZSH: Add back/forward history search keybindings

### Changed
- dotfiles/Vim: Improve configurator for theming
- dotfiles: Improve and relocate .dotfiles.config to setup
- dotfiles: Update update commands
- dotfiles: Update help commands
- Conky: Move conky-themes to lib directory
- dotfiles: Restructure configutation files
- Tmux: Improve tmuxline default settings
- ZSH: Separate .zshrc.local for desktop and server themes

### Fixed
- dotfiles: Fix paths in reconfigure command
- dotfiles/Tmux: Fix paths for TmuxlineSnapshot
- dotfiles/Conky: Fix paths for Lua config in Conky setup
- Vim: Improve guitablabel and its colors for GVim
- Vim: Fix opening .coffee files

### Removed
- ZSH: Remove vi-mode plugin

## 1.1.0 - 2015-05-18

[Unreleased]: https://github.com/egel/dotfiles/compare/v2.4.0...HEAD
[2.4.0]: https://github.com/egel/dotfiles/compare/v2.3.0...v2.4.0
[2.3.0]: https://github.com/egel/dotfiles/compare/v2.2.3...v2.3.0
[2.2.3]: https://github.com/egel/dotfiles/compare/v2.2.2...v2.2.3
[2.2.2]: https://github.com/egel/dotfiles/compare/v2.2.1...v2.2.2
[2.2.1]: https://github.com/egel/dotfiles/compare/v2.2.0...v2.2.1
[2.2.0]: https://github.com/egel/dotfiles/compare/v2.1.1...v2.2.0
[2.1.1]: https://github.com/egel/dotfiles/compare/v2.1.0...v2.1.1
[2.1.0]: https://github.com/egel/dotfiles/compare/v2.0.2...v2.1.0
[2.0.2]: https://github.com/egel/dotfiles/compare/v2.0.1...v2.0.2
[2.0.1]: https://github.com/egel/dotfiles/compare/v1.5.0...v2.0.1
[1.5.0]: https://github.com/egel/dotfiles/compare/v1.4.4...v1.5.0
[1.4.4]: https://github.com/egel/dotfiles/compare/v1.4.3...v1.4.4
[1.4.3]: https://github.com/egel/dotfiles/compare/v1.4.2...v1.4.3
[1.4.2]: https://github.com/egel/dotfiles/compare/v1.4.1...v1.4.2
[1.4.1]: https://github.com/egel/dotfiles/compare/v1.4.0...v1.4.1
[1.4.0]: https://github.com/egel/dotfiles/compare/v1.3.3...v1.4.0
[1.3.3]: https://github.com/egel/dotfiles/compare/v1.3.2...v1.3.3
[1.3.2]: https://github.com/egel/dotfiles/compare/v1.3.1...v1.3.2
[1.3.1]: https://github.com/egel/dotfiles/compare/v1.3.0...v1.3.1
[1.3.0]: https://github.com/egel/dotfiles/compare/v1.2.1...v1.3.0
[1.2.1]: https://github.com/egel/dotfiles/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/egel/dotfiles/compare/v1.1.0...v1.2.0

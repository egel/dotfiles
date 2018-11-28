# Configuration - OSX

## ZSH
How to **insert last word/argument** with `Alt` + `.` (like into the Linux console).

To do so, you have to open `Terminal preferences > Profiles > Keyboard` and mark `Use Option as Meta Key`.

## Known Issues

### Different PATH for Vim and MacVim
Working solution for Mac OSX is to simple: `ln -s ~/.zshrc ~/.zprofile` 

This issue is not caused by this setup. Here is the reference: <http://stackoverflow.com/a/24542893/1977012>



                   ,,                                                   ,,
    MMP""MM""YMM `7MM                    `7MM"""YMM                   `7MM
    P'   MM   `7   MM                      MM    `7                     MM
         MM        MMpMMMb.  .gP"Ya        MM   d     .P"Ybmmm .gP"Ya   MM
         MM        MM    MM ,M'   Yb       MMmmMM    :MI  I8  ,M'   Yb  MM
         MM        MM    MM 8M""""""       MM   Y  ,  WmmmP"  8M""""""  MM
         MM        MM    MM YM.    ,       MM     ,M 8M       YM.    ,  MM
       .JMML.    .JMML  JMML.`Mbmmd'     .JMMmmmmMMM  YMMMMMb  `Mbmmd'.JMML.
                                                     6'     dP
                                                     Ybmmmd'

           ,,                      ,...,,    ,,
         `7MM           mm       .d' ""db  `7MM
           MM           MM       dM`         MM
      ,M""bMM  ,pW"Wq.mmMMmm    mMMmm`7MM    MM  .gP"Ya  ,pP"Ybd
    ,AP    MM 6W'   `Wb MM       MM    MM    MM ,M'   Yb 8I   `"
    8MI    MM 8M     M8 MM mmmmm MM    MM    MM 8M"""""" `YMMMa.
    `Mb    MM YA.   ,A9 MM       MM    MM    MM YM.    , L.   I8
     `Wbmd"MML.`Ybmd9'  `Mbmo  .JMML..JMML..JMML.`Mbmmd' M9mmmP'


[![David](https://img.shields.io/david/strongloop/express.svg?style=flat-square)]()
[![MIT LICENSE](http://img.shields.io/badge/license-MIT-yellowgreen.svg?style=flat-square)](https://github.com/egel/dotfiles/blob/master/LICENSE)


> The Egel dotfiles for Ubuntu 14.04 LTS

* * *
[Installation](#installation) | [Update](#update) | [Extra features](#extra-features) | [Egel Cheat Sheet (PDF)](http://bit.ly/1wqcChS)
* * *


**Sample screenshots**

<img src="http://i.imgur.com/hwi7ia0.png" title="Desktop with conky" width="320" />
<img src="http://i.imgur.com/4l1A7rP.png" title="gVim with gruvbox colorscheme and NERDTree plugin on the right side" width="320" />
<img src="http://i.imgur.com/Z48dPBU.png" title="Guake with friends - Git + dircolors + vim + 256color test" width="320" />

This set contains configuration for:

  - **zsh** (oh-my-zsh)
  - **Git** (accounts, aliases)
  - **Vim**
  - **tmux** (key-bindings, copy-paste to clippboard)
  - **conky** (themes)


## Installation
> Don't be afraid, **instalator won't remove any of your previous configurations**. It will save them all, simply by renaming files into its directories.

> If need help run: `~/.dotfiles/setup/egel --help`

    A) With github account
    $ git clone --recursive git@github.com:egel/dotfiles.git ~/.dotfiles
    $ ~/.dotfiles/setup/egel --install

    B) Without github account
    $ git clone --recursive git://github.com/egel/dotfiles ~/.dotfiles
    $ ~/.dotfiles/setup/egel --install

The last thing is to set `Ubuntu Mono derivative Powerline` as default `terminal` and `guake` font and reset X, simply by restart the computer.

> In case that you won't reset your PC, you can reload config files without exiting from it.
>
> **Refresh configs**:
> - zsh: `source ~/.zshrc`
> - vim (into the program): `source ~/.vimrc`
> - tmux (into the program): `source ~/.tmux.conf`


## Update
To update repository and its submodules

    $ ~/.dotfiles/setup/egel --update


 [powerline-install-webpage]: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
 [.vim/bundle]: https://github.com/egel/dot-files/tree/master/.vim/bundle
 [.gitconfig]: https://github.com/egel/dot-files/blob/master/.gitconfig

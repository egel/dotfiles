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
[![MIT LICENSE](http://img.shields.io/badge/license-MIT-yellowgreen.svg?style=flat-square)](https://github.com/egel/dot-files/blob/master/LICENSE)


> Dot-files for Ubuntu 14.04 LTS

* * *
[Installation](#installation) | [Update](#update) | [Extra features](#extra-features) | [Egel Cheat Sheet (PDF)](http://bit.ly/1wqcChS)
* * *


**Sample screenshots**

<img src="http://i.imgur.com/hwi7ia0.png" title="Desktop with conky" width="320" />
<img src="http://i.imgur.com/4l1A7rP.png" title="gVim with gruvbox colorscheme and NERDTree plugin on the right side" width="320" />
<img src="http://i.imgur.com/Z48dPBU.png" title="Guake with friends - Git + dircolors + vim + 256color test" width="320" />

This set contains configuration for:

  - **Git** (accounts, aliases)
  - **Vim** ([modules](.vim/bundle))
  - **tmux** (key-bindings, copy-paste to clippboard)
  - **conky** (themes)
  - **bash** (256colors, history, aliases)


## Installation
> Don't be afraid, **instalator won't remove any of your previous configurations**. It will save them all, simply by renaming files into its directories.

    $ git clone --recursive git@github.com:egel/dot-files.git ~/dot-files && \
      ~/dot-files/setup/install.sh

The last thing is to set `Ubuntu Mono derivative Powerline` as default `terminal` and `guake` font and reset X, simply by restart the computer.

> In case that you won't reset your PC, you can reload config files without exiting from it.
>
> **Refresh configs**:
> - Bash: `source ~/.bashrc`
> - Vim (into program): `source ~/.vimrc`
> - tmux (into program): `source ~/.tmux.conf`


## Update
To update whole **dot-files** repository and its sub-repositories (like example vim plugins) just run:

    $ ~/dot-files/setup/update.sh

# Extra features

## All in one
Install all below extra features and more (history, aliases, prompt, ect.)

    $ wget https://raw.githubusercontent.com/egel/dot-files/master/setup/extras/bash_extras -q -O - >> ~/.bashrc

## Set 256 colors for terminal
Run this simple script to add 256 support

    $ wget https://raw.githubusercontent.com/egel/dot-files/master/setup/extras/xterm_and_tmux_256_colors.sh -q -O - | bash

## Add colors to man pages
Add some life to manual pages:

    $ wget https://raw.githubusercontent.com/egel/dot-files/master/setup/extras/color_man_pages -q -O - >> ~/.bashrc

## Funny
To have nice frogs with some fortune text whenever you run termial. hen just run:

    $ wget https://raw.githubusercontent.com/egel/dot-files/master/setup/extras/funny_frogs.sh -q -O - | bash

 [powerline-install-webpage]: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
 [.vim/bundle]: https://github.com/egel/dot-files/tree/master/.vim/bundle
 [.gitconfig]: https://github.com/egel/dot-files/blob/master/.gitconfig

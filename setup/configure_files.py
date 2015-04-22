#!/usr/bin/python3
# -*- coding: utf-8 -*-

import os
import time
import subprocess
from colors import Colors

# helper variables
home_dir                    = os.path.expanduser('~')
__dotfiles_dir__            = home_dir + "/dot-files"

__vim_dir_name__            = ".vim"
__vim_dir__                 = home_dir + "/" + __vim_dir_name__

__vimrc_name__              = ".vimrc"
__vimrc__                   = home_dir + "/" + __vimrc_name__

__tmux_conf_name__          = ".tmux.conf"
__tmux_conf__               = home_dir + "/" + __tmux_conf_name__

__gitconfig_name__          = ".gitconfig"
__gitconfig__               = home_dir + "/" + __gitconfig_name__

__gitconfig_local_name__    = ".gitconfig.local"
__gitconfig_local__         = home_dir + "/" + __gitconfig_local_name__

__zshrc_name__              = ".zshrc"
__zshrc__                   = home_dir + "/" + __zshrc_name__

__conkyrc_name__            = ".conkyrc"
__conkyrc__                 = home_dir + "/" + __conkyrc_name__

__conky_theme_name__        = "conky_seamod"


# Helper methods
def copy_config_file(_what, _file_name, _file_path):
    print(Colors.HEADER + "=== " + _what + " setup ===" + Colors.ENDC)
    # updating ._file_path
    if os.path.isfile(_file_path):
        print(_file_name + " config file exist")

        print(_file_name+ " ", end="")
        if os.path.islink(_file_path):
            # file is symlink
            print("is " + Colors.OKBLUE + "symlink." + Colors.ENDC)
        else:
            print("is simple file")

        print("Making save copy of " + _file_name + " file ... ", end="")
        os.rename(_file_path, _file_path + "(" + time.strftime("%c") + ")")
        print(Colors.OKGREEN + "DONE" + Colors.ENDC)

    print("Creating symlink for " + _file_name + " file ... ", end="")
    os.symlink(__dotfiles_dir__ + "/" + _file_name, _file_path)
    print(Colors.OKGREEN + "DONE" + Colors.ENDC)

def copy_config_dir(_what, _dir_name, _dir_path):
    print(Colors.HEADER + "=== " + _what + " setup ===" + Colors.ENDC)
    if os.path.isdir(_dir_path):
        print(_dir_name + " directory exist")

        print(_dir_name + " ", end="")
        if os.path.islink(_dir_path):
            print("is a symlink")
        else:
            print("is simple directory")

        print("Making save copy of " + _dir_name + " directory ... ", end="")
        os.rename(_dir_path, _dir_path + "(" + time.strftime("%c") + ")")
        print(Colors.OKGREEN + "DONE" + Colors.ENDC)

    print("Creating symlink for " + _dir_name + " directory ... ", end="")
    os.symlink(__dotfiles_dir__ + "/" + _dir_name, _dir_path)
    print(Colors.OKGREEN + "DONE" + Colors.ENDC)



# Vim setup
copy_config_file("Vim", __vimrc_name__, __vimrc__)

# updating .vim directory
copy_config_dir("Vim dir", __vim_dir_name__, __vim_dir__)

# tmux setup
copy_config_file("tmux", __tmux_conf_name__, __tmux_conf__)

## git setup
copy_config_file("gitconfig", __gitconfig_name__, __gitconfig__)
#copy_config_file("gitconfig.local", __gitconfig_local_name__, __gitconfig_local__)

## zshrc setup
copy_config_file("zshrc", __gitconfig_name__, __gitconfig__)

## dircolors setup


## Conky setup
copy_config_file("Conky", __conkyrc_name__, __conkyrc__)

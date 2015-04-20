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
__bash_aliases_name__       = ".bash_aliases"
__bash_aliases__            = home_dir + "/" + __bash_aliases_name__
__dircolors_name__          = ".dircolors"
__dircolors__               = home_dir + "/" + __dircolors_name__
__conkyrc_name__            = ".conkyrc"
__conkyrc__                 = home_dir + "/" + __conkyrc_name__
__conky_theme_name__        = "conky_seamod"


# Vim setup
print(Colors.HEADER + "=== Vim setup ===" + Colors.ENDC)
# updating .__vimrc__
if os.path.isfile(__vimrc__):
    print(__vimrc_name__ + " config file exist")

    print(__vimrc_name__+ " ", end="")
    if os.path.islink(__vimrc__):
        # file is symlink
        print("is " + Colors.OKBLUE + "symlink." + Colors.ENDC)
    else:
        print("is simple file")

    print("Making save copy of " + __vimrc_name__ + " file ... ", end="")
    os.rename(__vimrc__, __vimrc__ + "(" + time.strftime("%c") + ")")
    print(Colors.OKGREEN + "DONE" + Colors.ENDC)

print("Creating symlink for .vimrc file ... ", end="")
os.symlink(__dotfiles_dir__ + "/" + __vimrc_name__, __vimrc__)
print(Colors.OKGREEN + "DONE" + Colors.ENDC)


# updating .vim directory
if os.path.isdir(__vim_dir__):
    print(__vim_dir_name__ + " directory exist")

    print(__vim_dir_name__ + " ", end="")
    if os.path.islink(__vim_dir__):
        print("is a symlink")
    else:
        print("is simple directory")

    print("Making save copy of " + __vim_dir_name__ + " directory ... ", end="")
    os.rename(__vim_dir__, __vim_dir__ + "(" + time.strftime("%c") + ")")
    print(Colors.OKGREEN + "DONE" + Colors.ENDC)

print("Creating symlink for " + __vim_dir_name__ + " directory ... ", end="")
os.symlink(__dotfiles_dir__ + "/" + __vim_dir_name__, __vim_dir__)
print(Colors.OKGREEN + "DONE" + Colors.ENDC)


# tmux setup
print(Colors.HEADER + "\n=== tmux setup ===" + Colors.ENDC)
if os.path.isfile(__tmux_conf__):
    print(__tmux_conf_name__ + " config file exsist.")

    print(__tmux_conf_name__ + " ", end="")
    if os.path.islink(__tmux_conf__):
        # file is symlink
        print("is " + Colors.OKBLUE + "symlink." + Colors.ENDC)
    else:
        print("is simple file")

    print("Making save copy of " + __tmux_conf_name__ + " file ... ", end="")
    os.rename(__tmux_conf__, __tmux_conf__ + "(" + time.strftime("%c") + ")")
    print(Colors.OKGREEN + "DONE" + Colors.ENDC)

print("Creating symlink for " + __tmux_conf_name__ + " file ... ", end="")
os.symlink(__dotfiles_dir__ + "/" + __tmux_conf_name__, __tmux_conf__)
print(Colors.OKGREEN + "DONE" + Colors.ENDC)


# git setup
print(Colors.HEADER + "\n=== Git setup ===" + Colors.ENDC)
if os.path.isfile(__gitconfig__):
    print(__gitconfig_name__ + " file exsist.")

    print(__gitconfig_name__ + " ", end="")
    if os.path.islink(__gitconfig__):
        # file is symlink
        print("is " + Colors.OKBLUE + "symlink." + Colors.ENDC)
    else:
        print("is simple file")

    print("Making save copy of " + __gitconfig_name__ + " file ... ", end="")
    os.rename(__gitconfig__, __gitconfig__ + "(" + time.strftime("%c") + ")")
    print(Colors.OKGREEN + "DONE" + Colors.ENDC)

print("Creating symlink for " + __gitconfig_name__ + " file ... ", end="")
os.symlink(__dotfiles_dir__ + "/" + __gitconfig_name__, __gitconfig__)
print(Colors.OKGREEN + "DONE" + Colors.ENDC)


# bash aliases setup
print(Colors.HEADER + "\n=== Bash aliases setup ===" + Colors.ENDC)
if os.path.isfile(__bash_aliases__):
    print(__bash_aliases_name__ + " file exsist.")

    print(__bash_aliases_name__ + " ", end="")
    if os.path.islink(__bash_aliases_name__):
        # file is symlink
        print("is " + Colors.OKBLUE + "symlink." + Colors.ENDC)
    else:
        print("is simple file")

    print("Making save copy of " + __bash_aliases_name__ + " file ... ", end="")
    os.rename(__bash_aliases__, __bash_aliases__ + "(" + time.strftime("%c") + ")")
    print(Colors.OKGREEN + "DONE" + Colors.ENDC)

print("Creating symlink for" + __bash_aliases_name__ + " file ... ", end="")
os.symlink(__dotfiles_dir__ + "/" + __bash_aliases_name__, __bash_aliases__)
print(Colors.OKGREEN + "DONE" + Colors.ENDC)


# dircolors setup
print(Colors.HEADER + "\n=== dircolors setup ===" + Colors.ENDC)
if os.path.isfile(__dircolors__):
    print(__dircolors_name__ + " file exsist.")

    print(__dircolors_name__ + " ", end="")
    if os.path.islink(__dircolors_name__):
        # file is symlink
        print("is " + Colors.OKBLUE + "symlink." + Colors.ENDC)
    else:
        print("is simple file")

    print("Making save copy of " + __dircolors_name__ + " file ... ", end="")
    os.rename(__dircolors__, __dircolors__ + "(" + time.strftime("%c") + ")")
    print(Colors.OKGREEN + "DONE" + Colors.ENDC)

print("Creating symlink for" + __dircolors_name__ + " file ... ", end="")
os.symlink(__dotfiles_dir__ + "/" + __dircolors_name__, __dircolors__)
print(Colors.OKGREEN + "DONE" + Colors.ENDC)


# Conky setup
print(Colors.HEADER + "\n=== Conky setup ===" + Colors.ENDC)
if os.path.isfile(__conkyrc__):
    print(__conkyrc_name__ + " file exsist.")

    print(__conkyrc_name__ + " ", end="")
    if os.path.islink(__conkyrc__):
        # file is symlink
        print("is " + Colors.OKBLUE + "symlink." + Colors.ENDC)
    else:
        print("is simple file")

    print("Making save copy of " + __conkyrc_name__ + " file ... ", end="")
    os.rename(__conkyrc__, __conkyrc__ + "(" + time.strftime("%c") + ")")
    print(Colors.OKGREEN + "DONE" + Colors.ENDC)

print("Creating symlink for " + __conkyrc__ + " file ... ", end="")
os.symlink(__dotfiles_dir__ + "/conky-themes/" + __conky_theme_name__ + "/" + __conkyrc_name__, __conkyrc__)
print(Colors.OKGREEN + "DONE" + Colors.ENDC)


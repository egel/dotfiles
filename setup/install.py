#!/usr/bin/python3
# -*- coding: utf-8 -*-

import os
import time
from colors import Colors

# helper variables
home_dir = os.path.expanduser('~')
vimrc = home_dir + "/.vimrc"
tmux_conf = home_dir + "/.tmux.conf"

# Vim setup
print(Colors.HEADER + "=== Vim setup ===" + Colors.ENDC)
if os.path.isfile(vimrc):
    print(".vimrc config file exist.")

    if os.path.islink(vimrc):
        # file is symlink
        print(".vimrc is " + Colors.OKBLUE + "symlink." + Colors.ENDC)
    else:
        print(".vimrc is simple file")

    print("Making save copy of .vimrc ... ", end="")
    os.rename(vimrc, home_dir + "/.vimrc(" + time.strftime("%c") + ")")
    print(Colors.OKGREEN + "DONE" + Colors.ENDC)

print("Creating symlink for .vimrc ... ", end="")
os.symlink(home_dir + "/dot-files/.vimrc", vimrc)
print(Colors.OKGREEN + "DONE" + Colors.ENDC)


# tmux setup
print(Colors.HEADER + "\n=== tmux setup ===" + Colors.ENDC)
if os.path.isfile(tmux_conf):
    print(".tmux.conf config file exsist.")

    if os.path.islink(tmux_conf):
        # file is symlink
        print(".tmux.conf is " + Colors.OKBLUE + "symlink." + Colors.ENDC)
    else:
        print(".tmux.conf is simple file")

    print("Making save copy of .tmux.conf ... ", end="")
    os.rename(tmux_conf, home_dir + "/.tmux.conf(" + time.strftime("%c") + ")")
    print(Colors.OKGREEN + "DONE" + Colors.ENDC)

print("Creating symlink for .tmux.conf ... ", end="")
os.symlink(home_dir + "/dot-files/.tmux.conf", tmux_conf)
print(Colors.OKGREEN + "DONE" + Colors.ENDC)

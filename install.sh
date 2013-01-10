#!/usr/bin/zsh
# Simple script for installing configuration files
#
# For each file contained in dotfiles, creates a synbolic link to it in
# the user's home directory.

current_dir=`pwd`

for conffile in dotfiles/.[a-zA-Z]*
do
    echo $current_dir/$conffile
    ln -sf $current_dir/$conffile ~/`basename $conffile`
done
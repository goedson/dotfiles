#!/usr/bin/zsh
# Simple script for installing configuration files
#
# For each file contained in dotfiles, creates a synbolic link to it in
# the user's home directory.

current_dir=`pwd`

for conffile in `find dotfiles -type f -a -not -name \*~`
do
    filepath=`echo $conffile|sed 's/^dotfiles\///'`
    dirpath=`dirname $filepath`
    mkdir -p ~/$dirpath
    echo installing "'$current_dir/$conffile'" to "'~/$filepath'"
    ln -sf $current_dir/$conffile ~/$filepath
done

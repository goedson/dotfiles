#!/usr/bin/zsh
# Simple script for installing configuration files
#
# For each file contained in dotfiles, creates a synbolic link to it in
# the user's home directory.

current_dir=`pwd`

for conffile in `find dotfiles -type f`
do
    echo $current_dir/$conffile
    filepath=`echo $conffile|sed 's/^dotfiles\///'`
    dirpath=`dirname $filepath`
#    echo $filepath
#    echo $dirpath
    mkdir -p ~/$dirpath
    ln -sf $current_dir/$conffile ~/$filepath
    #ln -sf $current_dir/$conffile ~/`basename $conffile`
done

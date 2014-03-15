#!/bin/bash

#Modified script from Joe to symlink in dotfiles and keep Git happy using it's own directory.

########## Variables

dir=/root/cybera-dotfiles
files=`cd $dir; ls -d .[a-z]* | grep -v .git$`    # list of files/folders to symlink in homedir

##########

# Create symlinks
for file in $files; do
    ln -fs $dir/$file /root/$file
done

# git submodules (vim)
git submodule init
git submodule update

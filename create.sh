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

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/msanders/snipmate.vim snipmate
git clone https://github.com/godlygeek/tabular
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/rodjek/vim-puppet puppet
git clone https://github.com/vim-ruby/vim-ruby
git clone https://github.com/hallison/vim-markdown.git

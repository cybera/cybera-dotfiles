#!/bin/bash

#Modified script from Joe to symlink in dotfiles and keep Git happy using it's own directory.

########## Variables

dir=~/cybera-dotfiles
files=`cd $dir; ls -d .[a-z]* | grep -v .git$`    # list of files/folders to symlink in homedir

##########

# Create symlinks
for file in $files; do
    ln -fs $dir/$file ~/$file
done

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install vim plugins
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone -q https://github.com/tpope/vim-fugitive
git clone -q https://github.com/msanders/snipmate.vim snipmate
git clone -q https://github.com/godlygeek/tabular
git clone -q https://github.com/scrooloose/syntastic
git clone -q https://github.com/rodjek/vim-puppet puppet
git clone -q https://github.com/vim-ruby/vim-ruby
git clone -q https://github.com/hallison/vim-markdown.git
git clone -q https://github.com/fatih/vim-hclfmt
git clone -q https://github.com/hashivim/vim-hashicorp-tools
git clone -q https://github.com/zeek/vim-zeek

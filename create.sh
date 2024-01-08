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
git clone -q https://github.com/tpope/vim-fugitive 2>/dev/null
git clone -q https://github.com/msanders/snipmate.vim snipmate 2>/dev/null
git clone -q https://github.com/godlygeek/tabular 2>/dev/null
git clone -q https://github.com/scrooloose/syntastic 2>/dev/null
git clone -q https://github.com/rodjek/vim-puppet puppet 2>/dev/null
git clone -q https://github.com/vim-ruby/vim-ruby 2>/dev/null
git clone -q https://github.com/hallison/vim-markdown.git 2>/dev/null
git clone -q https://github.com/fatih/vim-hclfmt 2>/dev/null
git clone -q https://github.com/hashivim/vim-hashicorp-tools 2>/dev/null
git clone -q https://github.com/fatih/vim-go.git 2>/dev/null
# Hack due to 18.04
cd vim-go
git co v1.28
cd ..
git clone -q https://github.com/zeek/vim-zeek 2>/dev/null

# Vim Colours
mkdir -p ~/.vim/colors
curl -o ~/.vim/colors/toast.vim https://raw.githubusercontent.com/jsit/toast.vim/master/colors/toast.vim

# Make a 0 the last exit code
exit 0

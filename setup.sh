#!/bin/bash

#install various plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/undodir
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

#install powerline fonts
cd ~/.fonts && wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
mkdir ~/.config/fontconfig/conf.d/

cd ~/.config/fontconfig/conf.d/ && wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

#symlink my own dotfiles
ln -sf $PWD/.vimrc ~/.vimrc 
ln -sf $PWD/.conkyrc ~/.conkyrc
ln -sf $PWD/.zshrc ~/.zshrc

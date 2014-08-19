#!/bin/bash

#install various plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/undodir
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

#symlink my own dotfiles
ln -sf $PWD/.vimrc ~/.vimrc 
ln -sf $PWD/.conkyrc ~/.conkyrc
ln -sf $PWD/.zshrc ~/.zshrc

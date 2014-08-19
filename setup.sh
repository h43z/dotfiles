#!/bin/bash
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/undodir
ln -sf $PWD/.vimrc ~/.vimrc 
ln -sf $PWD/.conkyrc ~/.conkyrc
ln -sf $PWD/.zshrc ~/.zshrc

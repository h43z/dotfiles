#!/bin/bash
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/olivierverdier/zsh-git-prompt.git ~/.zsh/git-prompt
# remove underline in pathnames manually
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/syntax-highlighting
### install powerline fonts
(cd ~/.fonts && curl -LOs https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf)
mkdir -p ~/.config/fontconfig/conf.d/;
(cd ~/.config/fontconfig/conf.d/ && curl -LOs https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf)
#symlink my own dotfiles
ln -sf $PWD/vimrc ~/.vimrc 
ln -sf $PWD/conkyrc ~/.conkyrc
ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/tmux.conf ~/.tmux.conf
mkdir -p ~/.vim/undodir
echo "dotfiles are ready to go"

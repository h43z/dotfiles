#!/bin/bash
sudo apt-get install -y git vim zsh tmux
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/olivierverdier/zsh-git-prompt.git ~/.zsh/git-prompt
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/syntax-highlighting

mkdir -p ~/.config/terminator/
mkdir -p ~/.config/htop/
mkdir -p ~/.vim/undodir

ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/terminator.conf ~/.config/terminator/config
ln -sf $PWD/conkyrc ~/.conkyrc
ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/tmux.conf ~/.tmux.conf
ln -sf $PWD/htoprc ~/.config/htop/htoprc

vim -i NONE -c VundleUpdate -c quitall

echo "All dotfiles are in place"

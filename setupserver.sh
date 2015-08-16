#!/bin/bash
sudo apt-get install -y vim-nox git zsh tmux
git clone https://github.com/olivierverdier/zsh-git-prompt.git ~/.zsh/git-prompt
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/syntax-highlighting

mkdir -p ~/.config/htop/
mkdir -p ~/.vim/undodir/
mkdir -p ~/.vim/autoload/

ln -sfn $PWD/plug.vim ~/.vim/autoload/plug.vim
ln -sfn $PWD/vimrc ~/.vimrc
ln -sfn $PWD/zshrc ~/.zshrc
ln -sfn $PWD/tmux.conf ~/.tmux.conf
ln -sfn $PWD/htoprc ~/.config/htop/htoprc

touch ~/.todo

yes | vim -u NONE -c PlugInstall -c quitall

echo "All dotfiles are in place"

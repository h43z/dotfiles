#!/bin/bash
sudo apt-get install -y vim-gnome git zsh tmux
git clone https://github.com/olivierverdier/zsh-git-prompt.git ~/.zsh/git-prompt
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/syntax-highlighting

mkdir -p ~/.config/terminator/
mkdir -p ~/.config/htop/
mkdir -p ~/.vim/undodir/
mkdir -p ~/.vim/autoload/

ln -sfn $PWD/plug.vim ~/.vim/autoload/plug.vim
ln -sfn $PWD/vimrc ~/.vimrc
ln -sfn $PWD/vimrc ~/.nvimrc
ln -sfn $PWD/terminator.conf ~/.config/terminator/config
ln -sfn $PWD/zshrc ~/.zshrc
ln -sfn $PWD/tmux.conf ~/.tmux.conf
ln -sfn $PWD/htoprc ~/.config/htop/htoprc
ln -sfn $PWD/openbox ~/.config/openbox
ln -sfn $PWD/i3 ~/.i3
ln -sfn $PWD/xinitrc ~/.xinitrc
ln -sfn $PWD/Xresources ~/.Xresources

touch ~/.private.sh
touch ~/.todo

vim -c PlugUpdate -c quitall

echo "All dotfiles are in place"

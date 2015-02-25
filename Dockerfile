FROM debian:unstable
RUN apt-get update && apt-get install -y \
zsh \
vim-nox \
git \
curl \
wget \
tmux \
htop \
golang \
nodejs \
weechat \
dnsutils \
build-essential
WORKDIR /home
ADD . /home/dotfiles/
RUN cd dotfiles && ./setup.sh >/dev/null
CMD zsh

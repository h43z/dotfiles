HISTFILE=~/.histfile
HISTSIZE=4000000
SAVEHIST=4000000

setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history
setopt autocd
setopt promptsubst
setopt extended_glob
setopt bang_hist
setopt interactivecomments
unsetopt rm_star_silent
bindkey '^R' history-incremental-search-backward

PROMPT='%n@$HOST:%~ 
%# '
RPROMPT='%?'

typeset -U path
path=(~/bin $path)
 autoload -U compinit
  compinit
zstyle ':completion:*' menu select

alias ll='ls -l'
alias vim="vim -u ~/.vimrc"
alias newsbeuter="newsbeuter -q"
alias mutt="mutt -n"
alias ls='ls --color=auto'
alias irc='ssh -t jupiter tmux at -t irc'
alias todo='vim ~/.todo'
alias nvminit='source ~/.nvm/nvm.sh && nvm use'
alias rvminit='source ~/.rvm/scripts/rvm'

export LANG=en_US.UTF-8
export GOPATH=/home/rich/projects/go
export ANDROID_HOME=/opt/android-sdk-linux
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=${PATH}:~/.nvm/versions/node/v8.6.0/bin
export PATH=${PATH}:~/.rvm/bin
export PATH=${PATH}:/opt/bitcoin-0.15.0/bin

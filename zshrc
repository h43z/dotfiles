HISTFILE=~/.histfile
HISTSIZE=400000
SAVEHIST=400000

setopt autocd
setopt hist_ignore_dups share_history inc_append_history extended_history

if type xset > /dev/null; then
  xset r rate 200 60
fi

# safety first
git config --global user.email "notyetset"
git config --global user.name "notyetset"

vless="vim -R -c 'set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma' -"

# exports
export PATH=$PATH:$HOME/projects/go/bin
export PATH=$PATH:/home/rich/Android/Sdk/platform-tools
export PATH=$PATH:/opt/vert.x-2.1.2/bin
export PATH=$PATH:/sbin
export PATH=$PATH:~/bin
export GOPATH=~/projects/go
export MANPAGER="/bin/sh -c \"col -b | $vless\""

# aliases
alias vless=$vless
alias vman='_(){ $@ 2>&1 | vless};_'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias ls='ls -h --color'
alias ll='ls -lh --color'
alias l='ls -lh --color'
alias cd..='cd ..'
alias cd...='cd ../../'
alias cd....='cd ../../../'
alias lookfor="grep -i -R -n --color"
alias rz='source ~/.zshrc'
alias upgrade='sudo apt update && sudo apt upgrade'
alias di='docker images'
alias dps='docker ps'
alias dic='docker rmi $(docker images -f "dangling=true" -q)'
alias dcc='docker rm $(docker ps -aq)'
alias dins='docker inspect'
alias gc='git commit -v'
alias gac='git commit -a -v'
alias gco='git checkout'
alias gb='git branch -avv'
alias ga='git add'
alias ga.='git add .'
alias gpush='git push'
alias gpull='git pull'
alias gs='git status -sb'
alias gd='git diff --color'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias container='docker run -it --rm myubuntu'
alias tmux='TERM=screen-256color-bce tmux'
alias tl='tmux list-sessions'
alias ta='tmux attach -t'
alias v='vim -p'
alias vim='vim -p'
alias grep='egrep --color'
alias madison='apt-cache madison'
alias policy='apt-cache policy'
alias search='_(){apt-cache search $1 | grep $1};_'
alias pkg='dpkg --get-selections | grep -v deinstall | grep'
alias mkcd='_(){ mkdir $1 && cd $1};_'

# binds
bindkey -v
bindkey -M vicmd v edit-command-line
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# vi mode
autoload edit-command-line; zle -N edit-command-line
export KEYTIMEOUT=1
vim_ins_mode="%%"
vim_cmd_mode="%{$fg[yellow]%}% (vi)%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# completion
autoload -U compinit && compinit
zstyle ':completion:*' menu select

# prompt
setopt promptsubst
source ~/.zsh/git-prompt/zshrc.sh
GIT_PROMPT_EXECUTABLE="haskell"
#ZSH_THEME_GIT_PROMPT_NOCACHE="0"
ZSH_THEME_GIT_PROMPT_CACHE=1

function battery {
 if type "acpi" > /dev/null; then
  acpi | grep -o "[0-9]*%"
 fi
}

function  container_check(){
 if [ -f /.dockerinit ]; then
  echo "(container) ";
 fi
}

container=$(container_check)
autoload -U colors && colors
user="%{$fg[cyan]%}%n%{$reset_color%}"
host="%{$fg[green]%}%m%{$reset_color%}"
dir="%{$fg[yellow]%}%~%{$reset_color%}"
ret="%{$fg_no_bold[magenta]%}%?%{$reset_color%}"
ts="%{$fg_no_bold[magenta]%}%*%{$reset_color%}"

PROMPT='$user $host $dir $(git_super_status)
$container$vim_mode '
RPROMPT='$ret %{$fg[magenta]%}$(battery) %}%{$reset_color%} $ts'

# syntax-highlighting
source ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
#ZSH_HIGHLIGHT_PATTERNS+=('rm *' 'bg=red')

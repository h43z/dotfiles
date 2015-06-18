HISTFILE=~/.histfile
HISTSIZE=4000000
SAVEHIST=4000000

setopt hist_ignore_dups share_history inc_append_history extended_history correct autocd promptsubst extended_glob

source ~/.private.sh
source ~/.vim/bundle/gruvbox/gruvbox_256palette.sh

# key press repeat setting
if type xset > /dev/null && [ -n "$DISPLAY" ]; then
  xset r rate 200 60
  xset mouse 0 0
  xset b off
fi

# exports
export EDITOR=vim
export PATH=~/.linuxbrew/bin:$PATH
export MANPATH=$MANPATH:~/.linuxbrew/share/man
export INFOPATH=$INFOPATH:~/.linuxbrew/share/info
export PATH=$PATH:~/projects/go/bin
export PATH=$PATH:~/bin:/sbin:/usr/sbin
export GOPATH=~/projects/go

vless="vim -R -c 'set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma' -c 'normal L' -"
export MANPAGER="/bin/sh -c \"col -b | $vless\""

# aliases
## misc
alias zshrc='vim ~/.zshrc'
alias ls='ls -th --color'
alias df='df -h'
alias ll='ls -lth --color'
alias l='ll'
alias cd..='cd ..'
alias cd...='cd ../../'
alias rz='source ~/.zshrc'
alias upgrade='sudo apt update && apt list --upgradable && sudo apt upgrade'
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'
alias mkcd='_(){mkdir $1 && cd $1};_'
alias trash='_(){mv $@ ~/tmp/trash/};_'
alias soon='sleep 2 &&'
alias adbinput='_(){msg="$@" && adb shell input text ${msg// /%s}};_'
alias wtf='ping 8.8.8.8'
alias omg='ping google.com'
alias re='sudo $(fc -ln -1)'
alias watch='watch -d -c'
alias j='jobs'
alias todo='vim ~/.todo'
alias ducks='du -cks -h * | sort -rh | head'
alias bsi='r=$RANDOM;echo "#!/bin/bash\n" > script_$r.sh && chmod +x script_$r.sh && vim script_$r.sh'
## suffix
alias -s jpg=viewnior
alias -s png=viewnior
## grep/ag
alias grep='grep --color'
alias grepc='grep -n -C 2'
alias agc='ag -n -C 2'
alias lookfor="grep -i -R -n --color"
## docker
alias container='docker run -it --rm mydebian'
alias di='docker images'
alias dps='docker ps'
alias dic='docker rmi $(docker images -f "dangling=true" -q)'
alias dcc='docker rm $(docker ps -q --filter status=exited)'
alias dins='docker inspect'
alias dih='docker images | head'
alias ds='docker ps | grep -v NAMES | awk "{ print \$NF }" | tr "\n" " " | xargs docker stats'
## git
alias gnl='git notes list'
alias gne='git notes edit'
alias gc='git commit -v'
alias gca='git commit -v --amend'
alias gac='git commit -a -v'
alias gco='git checkout'
alias gb='git branch -avv'
alias ga='git add'
alias ga.='git add .'
alias gpush='git push'
alias gpull='git pull'
alias gs='git status -sb'
alias gd='git diff --color'
alias gls='git log --stat'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
## tmux
alias tmuxconf='vim ~/.tmux.conf'
alias tmux='TERM=screen-256color-bce tmux'
alias tl='tmux list-sessions'
alias ta='tmux attach -t'
alias ts='tmux switch -t'
alias tn='tmux new -s'
## vim
alias v='vim'
alias vman='_(){ $@ 2>&1 | vless};_'
alias vimrc='vim ~/.vimrc'
## apt
alias madison='apt-cache madison'
alias policy='apt-cache policy'
alias search='apt-cache search'
alias install='_(){apt-get install "$1"};_'
#alias pkg='dpkg --get-selections | grep -v deinstall | grep'
alias pkg='dpkg -l | tr -s " " | grep'
alias listi='apt list --installed'
alias listu='apt list --upgradable'
alias depends='apt-cache depends'
alias rdepends='apt-cache rdepends --installed'


# Anon first
git config --global user.email "NotYetSet"
git config --global user.name "NotYetSet"

# binds
bindkey -v
bindkey -M vicmd v edit-command-line
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# very smart completion
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'

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
source ~/.zsh/git-prompt/zshrc.sh
if [ -x "$HOME/.zsh/git-prompt/dist/build/gitstatus/gitstatus" ]; then
  GIT_PROMPT_EXECUTABLE="haskell"
else
  GIT_PROMPT_EXECUTABLE="python"
fi
ZSH_THEME_GIT_PROMPT_NOCACHE="0"

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
ret="%{$fg[white]%}%?%{$reset_color%}"

PROMPT='$user at $host in $dir $(git_super_status)
$container$vim_mode '
RPROMPT='$ret'

# syntax-highlighting
source ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

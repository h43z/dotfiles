HISTFILE=~/.histfile
HISTSIZE=4000000
SAVEHIST=4000000
setopt hist_ignore_dups share_history inc_append_history extended_history correct autocd promptsubst extended_glob
source ~/.vim/bundle/gruvbox/gruvbox_256palette.sh

# key press repeat setting
if type xset > /dev/null; then
  xset r rate 200 60
  xset mouse 0 0
fi

# safety first
git config --global user.email "NotYetSet"
git config --global user.name "NotYetSet"

vless="vim -R -c 'set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma' -"

# exports
export PATH=$PATH:~/projects/go/bin
export PATH=$PATH:~/bin:/sbin:/usr/sbin
export PATH=$PATH:~/Android/Sdk/platform-tools:~/Android/Sdk/tools
export GOPATH=~/projects/go
export MANPAGER="/bin/sh -c \"col -b | $vless\""

# aliases
## misc
alias zshrc='vim ~/.zshrc'
alias ls='ls -th --color'
alias df='df -h'
alias ll='ls -lth --color'
alias l='ls -lh --color'
alias cd..='cd ..'
alias cd...='cd ../../'
alias rz='source ~/.zshrc'
alias upgrade='sudo apt update && apt list --upgradable && sudo apt upgrade'
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'
alias mkcd='_(){mkdir $1 && cd $1};_'
alias trash='_(){mv $@ ~/tmp/trash/};_'
alias soon='sleep 2 &&'
alias adbinput='_(){msg="$@" && adb shell input text ${msg// /%s}};_'
## suffix
alias -s jpg=viewnior
alias -s png=viewnior
## grep/ag
alias grep='egrep --color'
alias grepc='grep -n -C 2'
alias agc='ag -n -C 2'
alias lookfor="grep -i -R -n --color"
## docker
alias container='docker run -it --rm mydebian bash'
alias di='docker images'
alias dps='docker ps'
alias dic='docker rmi $(docker images -f "dangling=true" -q)'
alias dcc='docker rm $(docker ps -aq)'
alias dins='docker inspect'
## git
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
alias vless=$vless
alias vman='_(){ $@ 2>&1 | vless};_'
alias vimrc='vim ~/.vimrc'
alias v='vim -p'
alias vim='vim -p'
## apt
alias madison='apt-cache madison'
alias policy='apt-cache policy'
alias search='_(){apt-cache search "$1" | grep $1};_'
#alias pkg='dpkg --get-selections | grep -v deinstall | grep'
alias pkg='dpkg -l | tr -s " " | grep'
alias listi='apt list --installed'
alias listu='apt list --upgradable'
alias depends='apt-cache depends'
alias rdepends='apt-cache rdepends --installed'

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
ret="%{$fg_no_bold[magenta]%}%?%{$reset_color%}"
ts="%{$fg_no_bold[magenta]%}%*%{$reset_color%}"

PROMPT='$user $host $dir $(git_super_status)
$container$vim_mode '
RPROMPT='$ret %{$fg[magenta]%}$(battery) %}%{$reset_color%} $ts'

# syntax-highlighting
source ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)



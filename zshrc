HISTFILE=~/.histfile
HISTSIZE=4000
SAVEHIST=10000
setopt autocd
if type xset > /dev/null; then
  xset r rate 200 60
fi

#safety first
git config --global user.email "notyetset"
git config --global user.name "notyetset"

#exports
export PATH="$PATH:$HOME/projects/go/bin:/opt/android-studio/sdk/platform-tools:/opt/vert.x-2.1.2/bin"
export GOPATH=~/projects/go
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist norelativenumber nonu noma' -\""

#aliases
alias vimrc='vim ~/.vimrc'
alias ls='ls -h --color'
alias cd..='cd ..'
alias lookfor="grep -i -R -n --color"
alias ll='ls -lh --color'
alias rz='source ~/.zshrc'
alias upgrade='sudo apt-get update && sudo apt-get upgrade'
alias di='docker images'
alias dps='docker ps'
alias gc='git commit'
alias gb='git branch -a'
alias gp='git push'
alias gs='git status -sb'
alias gd='git diff --color-words'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias container='docker run -it --rm myubuntu'
alias tmux='TERM=screen-256color-bce tmux'
alias tl='tmux list-sessions'
alias ta='tmux attach -t'
alias vless='vim - -c "set nomod norelativenumber nonu noma"'

#binds
bindkey -v
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

#completion
autoload -U compinit && compinit
zstyle ':completion:*' menu select

#prompt
setopt promptsubst
source ~/.zsh/git-prompt/zshrc.sh
ZSH_THEME_GIT_PROMPT_NOCACHE="1"

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
$container%% '
RPROMPT='$ret %{$fg[magenta]%}$(battery) %}%{$reset_color%} $ts'

#syntax-highlighting
source ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh


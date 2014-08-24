HISTFILE=~/.histfile
HISTSIZE=4000
SAVEHIST=10000
setopt autocd
bindkey -v

#aliases
alias ls='ls -H --color'
alias ll='ls -lH --color'
alias rz='source ~/.zshrc'
#completion
autoload -U compinit && compinit
zstyle ':completion:*' menu select

#prompt
source ~/.zsh/git-prompt/zshrc.sh

function battery {
 acpi | grep -o "[0-9]*%"
}

autoload -U colors && colors
setopt promptsubst
user="%{$fg[cyan]%}%n%{$reset_color%}"
host="%{$fg[green]%}%m%{$reset_color%}"
dir="%{$fg[yellow]%}%~%{$reset_color%}"
ret="%{$fg_no_bold[magenta]%}%?%{$reset_color%}"
ts="%{$fg_no_bold[magenta]%}%*%{$reset_color%}"

PROMPT='$user $host $dir $(git_super_status)
%# '
RPROMPT='[$ret] [%{$fg[magenta]%}$(battery) %}%{$reset_color%}] [$ts]'


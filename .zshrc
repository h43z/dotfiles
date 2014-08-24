HISTFILE=~/.histfile
HISTSIZE=4000
SAVEHIST=10000
setopt autocd
bindkey -v

#aliases
alias ls='ls -h --color'
alias ll='ls -lh --color'
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
$vim_mode '
RPROMPT='$ret %{$fg[magenta]%}$(battery) %}%{$reset_color%} $ts'

#vi-mode
export KEYTIMEOUT=1
vim_ins_mode="%%"
vim_cmd_mode="%{$fg[yellow]%}% (cmd)%{$reset_color%}"
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

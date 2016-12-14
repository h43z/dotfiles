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

PROMPT='%n@$HOST:%~ 
%# '
RPROMPT='%?'

typeset -U path
path=(~/bin $path)
 autoload -U compinit
  compinit
zstyle ':completion:*' menu select

alias newsbeuter="newsbeuter -q"
alias mutt="mutt -n"
export LANG=en_US.UTF-8

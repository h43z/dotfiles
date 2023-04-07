HISTFILE=~/.histfile
HISTSIZE=4000000
SAVEHIST=4000000

setopt hist_ignore_all_dups
#setopt inc_append_history
#setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history
setopt autocd
setopt promptsubst
setopt extended_glob
setopt bang_hist
setopt interactivecomments
unsetopt rm_star_silent

bindkey -v
bindkey '^R' history-incremental-search-backward

PROMPT="%n@$HOST:%~ "$'\n'"%# "
alias -g V='| vim -'
alias -g G='| grep -i'
alias svim='sudo -Es vim'
alias cdtmp='cd $(mktemp -d)'
alias t='todostack.sh'
alias todo='todostack.sh'
alias gj='grepjump.sh'
alias g='git'
alias tmux='tmux -u'
alias vim="vim -u ~/.vimrc"
alias v="vim -u ~/.vimrc"
alias j='journal.sh'
alias nb='newsboat -q'
alias mutt='mutt -n'
alias m='mutt -n'
alias ls='ls --color=auto'
alias l='ls -lh --color=auto'
alias ag='ag --ignore-dir node_modules'

export KEYTIMEOUT=1
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export VISUAL=vim
export EDITOR="$VISUAL"
export BROWSER=firefox

export GOPATH=/home/rich/projects/go

export ANDROID_HOME=/opt/android-sdk-linux
export ANDROID_SDK_ROOT=/opt/android-sdk-linux

export PATH="${PATH}:${ANDROID_HOME}/tools"
export PATH="${PATH}:${ANDROID_HOME}/platform-tools"
export PATH="${PATH}:~/bin"
export PATH="${PATH}:~/.local/bin"
export PATH="${PATH}:${GOPATH}/bin"

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

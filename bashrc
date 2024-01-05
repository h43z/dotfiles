# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTFILE=~/.histfile

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# history sharing between terminals
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

PS1="\u@\h:\w "$'\n'"% "

#alias -g V='2>&1 | vim -'
#alias -g G='| grep -i'
alias k=kubectl
alias ..='cd ..'
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
alias b="printf '\033[?11i'; vim -c \"set bt=nofile\" -c $ -c \":call search('\S', 'bW')|normal! kdG\" /tmp/scrollback;rm /tmp/scrollback"

export KEYTIMEOUT=1
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export VISUAL=vim
export EDITOR="$VISUAL"
export BROWSER=firefox


PATH="${PATH}:~/bin"
PATH="${PATH}:~/.local/bin"

GOPATH="$HOME/projects/go"
PATH="${PATH}:${GOPATH}/bin"

ANDROID_HOME=/opt/android-sdk-linux
ANDROID_SDK_ROOT=/opt/android-sdk-linux
PATH="${PATH}:${ANDROID_HOME}/tools"
PATH="${PATH}:${ANDROID_HOME}/platform-tools"

DENO_INSTALL="$HOME/.deno"
PATH="$DENO_INSTALL/bin:$PATH"

BUN_INSTALL="$HOME/.bun"
PATH="$BUN_INSTALL/bin:$PATH"

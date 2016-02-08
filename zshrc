HISTFILE=~/.histfile
HISTSIZE=4000000
SAVEHIST=4000000

setopt hist_ignore_dups
setopt share_history
setopt inc_append_history
setopt extended_history
setopt correct autocd
setopt promptsubst
setopt extended_glob
setopt bang_hist
setopt interactivecomments
unsetopt rm_star_silent

[ -f ~/.private.sh ] && source ~/.private.sh
[ -f ~/.vim/bundle/gruvbox/gruvbox_256palette.sh ] && source ~/.vim/bundle/gruvbox/gruvbox_256palette.sh

# exports
export EDITOR=vim
export PATH=$PATH:/sbin/:/usr/sbin
export BROWSER=google-chrome
export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

# aliases
## misc
alias n="networkctl"
alias less="less -Xr"
alias chrome="nohup google-chrome &> /dev/null & disown"
alias sues="sudo -Es"
alias hdisp="~/.screenlayout/home.sh"
alias sdisp="~/.screenlayout/solo.sh"
alias wdisp="~/.screenlayout/work.sh"
alias p='python'
alias -g json='| python -m json.tool'
alias -g gp='| grep -i'
alias zshrc='vim ~/.zshrc'
alias ls='ls -th --color'
alias df='df -h'
alias ll='ls -lth --color'
alias l='ll'
alias cd..='cd ..'
alias cd...='cd ../../'
alias rz='source ~/.zshrc'
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'
alias mkcd='_(){mkdir $1 && cd $1};_'
alias trash='_(){mv $@ ~/tmp/trash/};_'
alias soon='sleep 2 &&'
alias omg='ping google.com'
alias wtf='ping 8.8.8.8'
alias re='sudo $(fc -ln -1)'
alias watch='watch -d -c'
alias j='jobs'
alias todo='vim ~/.todo'
alias ducks='du -cks -h * | sort -rh | head'
alias testscript='r=$RANDOM;echo "#!/bin/bash\n" > script_$r.sh && chmod +x script_$r.sh && vim script_$r.sh'
alias topcmd='history 0 | awk '\''{ cmd[$2]++; count++; } END { for(a in cmd)printf "%d %0.1f%%  %s\n", cmd[a], cmd[a]/count*100, a}'\'' | sort -nr | head | nl -w1 | column -t'

## suffix
alias -s jpg=viewnior
alias -s png=viewnior
alias -s gif=$BROWSER
alias -s html=$BROWSER
## grep/ag
alias grep='grep --color'
alias grepc='grep -n -C 2'
alias agc='ag -C 2'
alias lookfor="grep -i -R -n --color"
## docker
alias d='docker'
alias di='docker images'
alias dps='docker ps'
alias dic='docker rmi $(docker images -a -f "dangling=true" -q)'
alias dcc='docker rm $(docker ps -q --filter status=exited)'
alias ds='docker ps | grep -v NAMES | awk "{ print \$NF }" | tr "\n" " " | xargs docker stats'
## git
alias gnl='git notes list'
alias gne='git notes edit'
alias gc='git commit -v'
alias gca='git commit -v --amend'
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
alias gdl='git diff "HEAD^" HEAD'
## tmux
alias tmuxconf='vim ~/.tmux.conf'
alias tl='tmux list-sessions'
alias ta='tmux attach -t'
alias ts='tmux switch -t'
alias tn='tmux new -s'
## vim
alias v='vim'
alias sv='sudo -E vim'
alias -g vman='2>&1 | vim -'
alias vimrc='vim ~/.vimrc'
## apt
alias install='sudo apt-get install --no-install-recommends'
alias upgrade='sudo apt update && apt list --upgradable && sudo apt upgrade'
alias madison='apt-cache madison'
alias policy='apt-cache policy'
alias search='apt-cache search --names-only'
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
#
bindkey -e
bindkey '^w' forward-word
bindkey '^b' backward-word

zle_highlight=(isearch:fg=blue)

# completion
autoload -U compinit && compinit
zstyle ':completion:*' menu select
# very smart completion
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'

zstyle ':completion:*' special-dirs true

if [ -x "$HOME/.zsh/git-prompt/dist/build/gitstatus/gitstatus" ]; then
  GIT_PROMPT_EXECUTABLE="haskell"
else
  GIT_PROMPT_EXECUTABLE="python"
fi

ZSH_THEME_GIT_PROMPT_NOCACHE="0"
source ~/.zsh/git-prompt/zshrc.sh

autoload -U colors && colors
user="%{$fg[cyan]%}%n%{$reset_color%}"
host="%{$fg[green]%}%m%{$reset_color%}"
dir="%{$fg[yellow]%}%~%{$reset_color%}"
ret="%{$fg[white]%}%?%{$reset_color%}"

PROMPT='$user at $host in $dir $(git_super_status)
%% '
RPROMPT='$ret'

source ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

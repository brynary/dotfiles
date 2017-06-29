export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export HISTCONTROL=ignoredups
export HISTSIZE=99999999999999

export GIT_PS1_SHOWDIRTYSTATE=1

source /etc/bash_completion.d/git-prompt
export PS1='\n$(if [ $? = 0 ]; then echo "\[\033[0;32m\]☺"; else echo "\[\033[0;31m\]☹"; fi) \[\033[01;36m\]\w \[\033[01;35m\]$(__git_ps1 "(%s)")\n\[\033[01;32m\] [devbox \t] \[\033[01;36m\]$\[\033[00m\] '

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

complete -o default -o nospace -F _git_checkout gco

if [ -f /usr/local/share/z.sh ]; then
  source /usr/local/share/z.sh
fi

if [ -f /Users/bhelmkamp/p/.docker.env ]; then
  source /Users/bhelmkamp/p/.docker.env
fi

alias top="top -ocpu"
alias fsizes="du -h -d 0 ./*"

alias ..="cd .."
alias ...="cd .. && cd .."
alias ....="cd .. && cd .. && cd .."

# ls
alias ls='ls --color -alFG'
alias ll='ls --color -alFG'
alias l='ls --color -alFG'

alias pwgen='dd if=/dev/urandom count=1 bs=48 2>/dev/null|uuencode -m -|tail -2|head -1'

# show difference between the HEAD and the index
alias staged="git diff --cached"

# show difference between working tree and the index
alias unstaged="git diff"

alias gdi="git diff"
alias gb="git branch -v"
alias gba="git branch -av"
alias gs="git status"
alias gst="git status"
alias gpr="git pull --rebase"
alias push="git push"
alias gco="git checkout"
alias gcm="git checkout master"
alias gc="git commit -v"
alias gpc="git-pair commit -v"
alias gam="git commit -v --amend"
alias grb="git rebase -i HEAD~10"
alias gca="git commit -a -v"
alias gpca="git-pair commit -a -v"
alias gitrmall='git ls-files --deleted|xargs git rm'

alias b="bundle exec"

export DOCKER_TLS_VERIFY=1

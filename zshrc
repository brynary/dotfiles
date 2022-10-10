# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias fsizes="du -h -d 0 ./*"

alias ..="cd .."
alias ...="cd .. && cd .."
alias ....="cd .. && cd .. && cd .."

alias ls='ls -alFG'
alias ll='ls -alFG'
alias l='ls -alFG'

alias pwgen='dd if=/dev/urandom count=1 bs=48 2>/dev/null|uuencode -m -|tail -2|head -1'

# show difference between the HEAD and the index
alias staged="git diff --cached"

# show difference between working tree and the index
alias unstaged="git diff"

alias gb="git branch -v"
alias gs="git status -sb"
alias gpr="git pull --rebase"
alias gco="git checkout"
alias gc="git commit -v"
alias gam="git commit -v --amend"
alias grb="git rebase -i HEAD~10"
alias gca="git commit -a -v"
alias gitrmall='git ls-files --deleted | xargs git rm'

if test "$(uname)" = "Darwin"; then
    export EDITOR="code --wait"
fi


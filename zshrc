# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GPG_TTY=$(tty)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"

# Completions via fpath (lazy-loaded by compinit)
fpath=(/opt/homebrew/share/zsh/site-functions ~/.bun $fpath)

plugins=()

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
alias gcm="git switch main"
alias gitrmall='git ls-files --deleted | xargs git rm'
alias save='gca --allow-empty-message -m ""'

if test "$(uname)" = "Darwin"; then
    export EDITOR="code --wait"
fi


# Load rbenv automatically by appending
# the following to ~/.zshrc:
# eval "$(rbenv init - zsh)"

# qlty
export QLTY_INSTALL="$HOME/.qlty"
export PATH="$QLTY_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/bhelmkamp/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

alias claude="claude --dangerously-skip-permissions"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/Users/bhelmkamp/.bun/bin:$PATH"
export PATH="/Users/bhelmkamp/p/fabro-sh/fabro/target/release:$PATH"

# # nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Load secrets
[ -f ~/.zshrc_secrets ] && source ~/.zshrc_secrets


# qlty completions
[ -s "/opt/homebrew/share/zsh/site-functions/_qlty" ] && source "/opt/homebrew/share/zsh/site-functions/_qlty"

source /Users/bhelmkamp/.daytona.completion_script.zsh

alias codex="codex --yolo"

implement() { local id=$(fabro run --goal-file "$1" --detach implement) && fabro logs --pretty -f "$id"; }

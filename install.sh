#!/bin/bash

dotfiles_dir=$(pwd)

rm -f ~/.gitconfig
ln -s $dotfiles_dir/gitconfig ~/.gitconfig

rm -f ~/.gitignore
ln -s $dotfiles_dir/gitignore ~/.gitignore

rm -f ~/.zshrc
ln -s $dotfiles_dir/zshrc ~/.zshrc
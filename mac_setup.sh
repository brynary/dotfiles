#!/bin/bash

echo "Running Software Update"
sudo softwareupdate --install --all --force

if xcode-select --print-path; then
    echo "XCode already installed"
else
    echo "Installing XCode..."
    xcode-select --install
fi

# Install oh-my-zsh
if test -d ~/.oh-my-zsh; then
    echo "Oh My Zsh already installed"
else
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Homebrew
if test -f /opt/homebrew/bin/brew; then
    echo "Homebrew already installed"
else
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install rust
if test -f ~/.cargo/bin/rustc; then
    echo "rust already installed"
else
    echo "Installing rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

echo "Updating Mac preferences..."
# Adjust settings for key press repeating
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Hide Dock by default
defaults write com.apple.dock "autohide" -bool "true"

# Disable shadow in screenshots
defaults write com.apple.screencapture "disable-shadow" -bool "false"

echo "Installing Homebrew packages..."
brew install coreutils gh openssl jq readline wget tree nodejs libpq rbenv

brew install --cask iterm2
brew install --cask google-chrome
brew install --cask soulver
brew install --cask spotify
brew install --cask 1password
brew install --cask zoom
brew install --cask slack
brew install --cask visual-studio-code
brew install --cask signal
brew install --cask reflect
brew install --cask zed

brew install --cask raycast
brew install --cask ghostty

brew install --cask chatgpt
brew install --cask claude
brew install --cask codex
brew install --cask discord
brew install --cask granola
brew install --cask whatsapp
brew install --cask microsoft-office
brew install --cask orbstack
brew install --cask wispr-flow
brew install --cask google-drive
brew install --cask claude-code
brew install gemini-cli
brew install tailscale

# Pixelmator Pro
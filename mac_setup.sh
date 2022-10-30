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
brew install --cask launchbar
brew install --cask google-chrome
brew install --cask soulver
brew install --cask spotify
brew install --cask asana
brew install --cask 1password
brew install --cask notion
brew install --cask sizeup
brew install --cask zoom
brew install --cask slack
brew install --cask loom
brew install --cask visual-studio-code
brew install --cask microsoft-excel
brew install --cask microsoft-word
brew install --cask miniconda

echo "Installing Mac App Store and packages..."
brew install mas # Mac App Store
mas install 1091189122 # Bear
# mas install 1289583905 # Pixelmator Pro

if test -f /usr/local/vanta/vanta-cli; then
    echo "Vanta agent already installed"
else
    echo "Downloading Vanta agent installer to ~/Downloads"
    wget "https://app.vanta.com/osquery/download/macOS" -O ~/Downloads/vanta.pkg
    echo "Done. Open ~/Downloads/vanta.pkg to install"
fi

if test -f /usr/local/bin/docker; then
    echo "Docker already installed"
else
    echo "Downloading Docker installer to ~/Downloads"
    wget "https://desktop.docker.com/mac/main/arm64/Docker.dmg" ~/Downloads/Docker.dmg
    echo "Done. Open ~/Downloads/Docker.dmg to install"
fi



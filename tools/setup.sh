#!/bin/fish

# Install commandline tools
sudo xcode-select --install

if [ "$(uname)" == "Darwin" ]; then

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  brew install fish
  brew install stow

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

  # Add source for fish
  curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null

  echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list

  sudo apt update

  if hash brew 2>/dev/null; then
    echo "Homebrew is installed"
  else
    echo "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    sudo chown -R $USER /usr/local
  fi

  sudo apt install nala -y
  sudo nala install fish -y
  sudo nala install stow -y

fi

# Unfold stowed configs
pushd "$HOME/.dotfiles"
stow .

# Git
git config --global core.excludesfile "$HOME/.gitignore_global"


if [ "$(uname)" == "Darwin" ]; then

  echo "Updating brews..."
  brew tap caskroom/cask
  brew update

  brew cask install google-chrome
  brew install --cask chromium
  brew install --cask raycast

  brew tap homebrew/cask-fonts && brew install --cask font-meslo-lg-nerd-font

  brew install wget
  brew install nvim
  brew install tmux
  brew install zellij

  brew install go
  brew install gum
  brew install vhs
  brew install node

  brew install 1password-cli
  brew install gpg
  brew install tree
  brew install terminal-notifier
  brew install z
  brew install zsh
  brew install fzf
  brew install fd
  brew install btop
  brew install htop
  brew install trash
  brew install ripgrep
  brew install watchman
  brew install openssl
  brew install neofetch
  brew install starship
  brew install colima
  brew install rbenv
  brew install cmatrix

  brew install qmk/qmk/qmk
  brew install qmk-toolbox
  brew install teensy_loader_cli

  brew cask install java
  brew cask install jce-unlimited-strength-policy
  brew install nats-server
  brew install redis
  brew install rabbitmq
  brew install protobuf

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
end

echo "run 'source $HOME/.dotfiles/tools/setup_rvm.sh'"

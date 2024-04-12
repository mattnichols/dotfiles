#!/bin/bash

#if [ -e "$HOME/.dotfiles" ]; then
#  echo ""
#  echo ""
#  echo "!!! dotfiles already installed"
#  echo ""
#  echo "  To star over run: uninstall_dotfiles"
#  echo ""
#  exit
#fi

pushd "$HOME"
git clone git@github.com:mattnichols/dotfiles.git "$HOME/.dotfiles"
# git clone https://github.com/mattnichols/dotfiles.git "$HOME/.dotfiles"
popd

# Setup env (setup apt/brew and install fish)
if [ "$(uname)" == "Darwin" ]; then

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  sudo chown -R $(whoami) $(brew --prefix)/*
  
  # brew install fish # This doesn't work
  brew install stow
  brew install fzf
  brew install starship
  brew install neofetch
  brew install trash
  brew install z
  brew install eza

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

pushd "$HOME/.dotfiles"
stow .

source "$HOME/.dotfiles/tools/set_shell.sh"
source "$HOME/.dotfiles/tools/setup.sh"

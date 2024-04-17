#!/bin/fish

# Install commandline tools
sudo xcode-select --install

if test "$(uname)" = "Darwin"

  brew install stow

else if test "$(expr substr $(uname -s) 1 5)" = "Linux"

  # Add source for fish
  curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null

  echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list

  sudo apt update

  sudo apt install nala -y
  sudo nala install stow -y

end

# Unfold stowed configs
pushd "$HOME/.dotfiles"
stow .

# Git
git config --global core.excludesfile "$HOME/.gitignore_global"

# Install Oh My Fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
omf install nvm

# Uninstall system node, if present
nvm use system
npm uninstall -g a_module

# Install stable
nvm install stable

if test "$(uname)" = "Darwin"

  echo "Updating brews..."
  brew tap caskroom/cask
  brew update

  brew cask install google-chrome
  brew install --cask chromium
  brew install --cask raycast

  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font

  brew install tmux
  brew install wget
  brew install nvim
  brew install zoxide # z
  brew install zellij
  brew install slack
  brew install keka # 7zip equivalent
  brew install vlc 
  brew install keycastr
  brew install coreutils

  brew install go
  brew install gum
  brew install vhs
  brew install delve # for go debugging

  brew install 1password-cli
  brew install gpg
  brew install bat
  brew install tree
  brew install terminal-notifier
  brew install zsh
  brew install fd
  brew install btop
  brew install htop
  brew install ripgrep
# watch for files changes and run something
  brew install watchman
  brew install openssl

# Docker desktop alternative
  brew install colima
  brew install rbenv
  brew install cmatrix
  brew install tldr

  brew install qmk/qmk/qmk
  brew install qmk-toolbox
  brew install teensy_loader_cli

else if test "$(expr substr $(uname -s) 1 5)" = "Linux"
end

rm -Rf $HOME/.local/share/omf
curl -L https://get.oh-my.fish | fish

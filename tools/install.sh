#!/bin/sh

if [ -e "$HOME/.dotfiles" ]; then
  echo ""
  echo ""
  echo "!!! dotfiles already installed"
  echo ""
  echo "  To star over run: uninstall_dotfiles"
  echo ""
  exit
fi

# Install Oh My ZSH
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

pushd "$HOME"
git clone git@github.com:mattnichols/dotfiles.git "$HOME/.dotfiles"
popd

. "$HOME/.dotfiles/tools/setup.sh"

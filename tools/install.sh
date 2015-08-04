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

pushd "$HOME"
git clone git@github.com:mattnichols/dotfiles.git "$HOME/.dotfiles"
popd

source "$HOME/.dotfiles/setup.sh"

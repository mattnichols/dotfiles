#!/bin/zsh

pushd ~/.dotfiles
for name in *; do
  target="$HOME/.$name"
  if [ -e $target ]; then
    echo "Removing $target"
    rm "$target"
  fi
done

# Implode RVM
rvm implode --force

# Unistall homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"

rm "$HOME/.ackrc*"
rm "$HOME/.bash*"
rm "$HOME/.configure*"
rm "$HOME/.gemrc*"
rm "$HOME/.gitconfig*"
rm "$HOME/.gitignore_global*"
rm "$HOME/.irbrc*"
rm "$HOME/.vimrc*"
rm "$HOME/.zlogin*"
rm "$HOME/.zsh*"
rm "$HOME/.zcomp*"
rm "$HOME/.z"
rm -Rf "$HOME/.atom"

uninstall_oh_my_zsh
rm -Rf "$HOME/.oh-my-zsh"
rm -Rf "$HOME/.dotfiles"

popd
chsh -s /bin/bash

echo "Relaunch Terminal!!"

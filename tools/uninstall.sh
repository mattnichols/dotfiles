#!/bin/zsh

pushd ~/.dotfiles
for name in *; do
  target="$HOME/.$name"
  if [ -e $target ]; then
	  echo "Removing $target"
    rm "$target"
  fi
done

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
rm -Rf "$HOME/.rvm"

uninstall_oh_my_zsh
rm -Rf "$HOME/.oh-my-zsh"
rm -Rf "$HOME/.dotfiles"

popd

echo "Relaunch Terminal!!"

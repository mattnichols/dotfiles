#!/bin/zsh

pushd ~/.dotfiles
for name in *; do
  target="$HOME/.$name"
  if [ -e $target ]; then
	  echo "Removing $target"
    rm "$target"
  fi
done

rm "$HOME/.profile"
rm "$HOME/.bash*"
rm "$HOME/.zsh*"
rm "$HOME/.zcomp*"
rm -R "$HOME/.rvm"
uninstall_oh_my_zsh
rm -R "$HOME/.oh-my-zsh"
rm -R "$HOME/.dotfiles"

popd

echo "Relaunch Terminal!!"
#exit
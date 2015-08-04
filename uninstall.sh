#!/bin/zsh

pushd ~/.dotfiles
for name in *; do
  target="$HOME/.$name"
  if [ -e $target ]; then
	  echo "Removing $target"
    /bin/rm "$target"
  fi
done

/bin/rm "$HOME/.profile"
/bin/rm "$HOME/.bash*"
/bin/rm "$HOME/.zsh*"
/bin/rm "$HOME/.zcomp*"
/bin/rm -Rf "$HOME/.rvm"
uninstall_oh_my_zsh
/bin/rm -Rf "$HOME/.oh-my-zsh"
/bin/rm -Rf "$HOME/.dotfiles"

popd

echo "Relaunch Terminal!!"
#exit
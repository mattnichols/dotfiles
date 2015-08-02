#!/bin/sh

cutstring="DO NOT EDIT BELOW THIS LINE"

for name in *; do
  target="$HOME/.$name"
  if [ -e $target ]; then
    echo "Removing $target"
    rm -f $target
  fi
done

rm -f $HOME/.profile
rm -f $HOME/.bash*
rm -f $HOME/.zsh*
rm -f $HOME/.zcomp*

rm -Rf $HOME/.rvm
uninstall_oh_my_zsh
rm -Rf $HOME/.oh-my-zsh
rm -Rf $HOME/.dotfiles

# chsh -s $(which bash)
exit
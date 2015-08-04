#!/bin/sh

for name in ~/.dotfiles/*; do
  target="$HOME/.$name"
  if [ -e $target ]; then
    echo "Removing $target"
    rm -f $target
  fi
done

rm -f ~/.profile
rm -f ~/.bash*
rm -f ~/.zsh*
rm -f ~/.zcomp*

rm -Rf ~/.rvm
uninstall_oh_my_zsh
rm -Rf ~/.oh-my-zsh
rm -Rf ~/.dotfiles

echo "Relaunch Terminal!!"
exit
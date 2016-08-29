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
rm -Rf "$HOME/.bundle"

## Uninstall Java
sudo rm -rf /Library/Java/JavaVirtualMachines/*.jdk
sudo rm -rf /Library/PreferencePanes/JavaControlPanel.prefPane
sudo rm -rf /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin
sudo rm -rf /Library/LaunchAgents/com.oracle.java.Java-Updater.plist
sudo rm -rf /Library/PrivilegedHelperTools/com.oracle.java.JavaUpdateHelper
sudo rm -rf /Library/LaunchDaemons/com.oracle.java.JavaUpdateHelper.plist
sudo rm -rf /Library/Preferences/com.oracle.java.Helper-Tool.plist
#################

uninstall_oh_my_zsh
rm -Rf "$HOME/.oh-my-zsh"
rm -Rf "$HOME/.dotfiles"

popd
chsh -s /bin/bash

echo "Relaunch Terminal!!"

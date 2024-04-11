#!/usr/bin/env bash

brew install fish

# Install RVM plugin
curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
echo "rvm default" >> ~/.config/fish/config.fish

rm -Rf /Users/matthew.nichols/.local/share/omf
curl -L https://get.oh-my.fish | fish

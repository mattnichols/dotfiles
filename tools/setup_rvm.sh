#!/bin/zsh

source "$HOME/.rvm/scripts/rvm"
echo "bundler" >> ~/.rvm/gemsets/global.gems
echo "omglog" >> ~/.rvm/gemsets/global.gems
echo "git-smart" >> ~/.rvm/gemsets/global.gems
echo "wirble" >> ~/.rvm/gemsets/global.gems

rvm install 2.2.0

rvm wrapper ruby-2.2.0@global --no-prefix omglog
rvm wrapper ruby-2.2.0@global --no-prefix git-smart-pull
rvm wrapper ruby-2.2.0@global --no-prefix git-smart-merge
rvm wrapper ruby-2.2.0@global --no-prefix git-smart-log
rvm wrapper ruby-2.2.0@global --no-prefix ~/.dotfiles/zsh_custom/plugins/light-git/gbrt
rvm @default do gem install fit-commit
rvm @global do gem install bundler
rvm @global do gem install omglog
rvm @global do gem install git-smart
rvm @global do gem install wirble

echo "Setup Complete!"

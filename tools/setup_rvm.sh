#!/bin/zsh

source "$HOME/.rvm/scripts/rvm"
rvm reload

# Enable silent auto reload
echo rvm_auto_reload_flag=2 >> ~/.rvmrc

# Enable auto reload
# echo rvm_auto_reload_flag=1 >> ~/.rvmrc

# echo "bundler" >> ~/.rvm/gemsets/global.gems
# echo "omglog" >> ~/.rvm/gemsets/global.gems
# echo "git-smart" >> ~/.rvm/gemsets/global.gems
# echo "wirble" >> ~/.rvm/gemsets/global.gems
version=2.2.1

rvm install $version
rvm use $version --default
rvm ruby-`echo $version` do gem install bundler

rvm ruby-`echo $version`@global do gem install omglog
rvm ruby-`echo $version`@global do gem install git-smart
rvm ruby-`echo $version`@global do gem install wirble

rvm wrapper ruby-`echo $version`@global --no-prefix omglog
rvm wrapper ruby-`echo $version`@global --no-prefix git-smart-pull
rvm wrapper ruby-`echo $version`@global --no-prefix git-smart-merge
rvm wrapper ruby-`echo $version`@global --no-prefix git-smart-log
rvm wrapper ruby-`echo $version`@global --no-prefix ~/.dotfiles/zsh_custom/plugins/light-git/gbrt

rvm default do gem install fit-commit

# Still need to implement a solution for bundler binstubs missing

# JRuby
version=jruby-9.0.1.0
rvm install $version

echo "Setup Complete!"

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
version=2.4.1

rvm autolibs enable

rvm install $version
rvm use $version --default
rvm ruby-`echo $version`@global do gem install bundler

# Setup bundler to use all but 1 CPU
number_of_cores=`sysctl -n hw.ncpu`
bundle config --global jobs `expr $number_of_cores - 1`

rvm ruby-`echo $version`@global do gem install omglog
rvm ruby-`echo $version`@global do gem install git-smart
rvm ruby-`echo $version`@global do gem install hirb
rvm ruby-`echo $version`@global do gem install irbtools
rvm ruby-`echo $version`@global do gem install fit-commit

rvm wrapper ruby-`echo $version`@global --no-prefix omglog
rvm wrapper ruby-`echo $version`@global --no-prefix git-smart-pull
rvm wrapper ruby-`echo $version`@global --no-prefix git-smart-merge
rvm wrapper ruby-`echo $version`@global --no-prefix git-smart-log
rvm wrapper ruby-`echo $version`@global --no-prefix fit_commit
rvm wrapper ruby-`echo $version`@global --no-prefix ~/.dotfiles/zsh_custom/plugins/light-git/gbrt

#rvm default do gem install fit-commit

# Still need to implement a solution for bundler binstubs missing

# JRuby
version=jruby-9.0.1.0
rvm install $version
rvm ruby-`echo $version`@global do gem install bundler

echo "Setup Complete!"

#! /bin/sh

mri
rvm current


# This should work!

# if [[ -a "Gemfile.local" ]]; then
#   echo "Dev dependencies already in place"
# else
#   ln ~/.dotfiles/zsh_custom/plugins/light-rails/Gemfile.local.ln ./Gemfile.local
# fi

# echo "Running bundle install..."
# BUNDLE_GEMFILE=Gemfile.local bundle install --no-cache


echo "# DEVUP--" >> Gemfile
echo 'gem "spring-commands-rspec", :group => :development' >> Gemfile
echo 'gem "guard-rspec", :group => :development' >> Gemfile
echo 'gem "guard-rubocop", :group => :development' >> Gemfile
echo 'gem "rb-fsevent", :group => :development' >> Gemfile
echo 'gem "terminal-notifier-guard", :group => :development' >> Gemfile
echo "# --DEVUP" >> Gemfile
bundle install --no-cache


echo "Running binstubs..."
# rm -rf bin/*
spring binstub --all


echo "Stopping spring..."
spring stop

echo "Starting spring..."
rails g > /dev/null

echo "Spring Status:"
spring status

echo "vendor/cache" >> .gitignore

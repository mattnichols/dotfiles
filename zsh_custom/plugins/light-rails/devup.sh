#! /bin/sh

# mri

if [[ -a "Gemfile.local" ]]; then
  echo "Dev dependencies already in place"
  ln -s ~/.dotfiles/zsh_custom/plugins/light-rails/Gemfile.local ./Gemfile.local
fi

echo "Running bundle install..."
bundle --gemfile=Gemfile.local --no-cache

echo "Running binstubs..."
spring binstub --all

echo "Stopping spring..."
spring stop

echo "Starting spring..."
rails g > /dev/null

echo "Spring Status:"
spring status

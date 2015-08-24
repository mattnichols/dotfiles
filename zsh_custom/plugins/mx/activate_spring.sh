#! /bin/sh

echo "ruby-2.2.1" > .ruby-version
rvm use ruby-2.2.1

if cat Gemfile | grep -q "spring-commands-rspec"; then
  echo "Dependencies already in gemfile"
else
  rvm @global do gem install spring-commands-rspec
  rvm @global do gem install rspec-rails
  rvm @global do gem install guard-rspec
  rvm @global do gem install rb-fsevent

  echo "# Local development gems" >> Gemfile
  echo "gem 'spring-commands-rspec', :group => :development" >> Gemfile
  echo "gem 'rspec-rails', :group => :development" >> Gemfile
  echo "gem 'guard-rspec', :group => :development" >> Gemfile
  echo "gem 'rb-fsevent', :group => :development" >> Gemfile
  echo "gem 'terminal-notifier-guard', :group => :development" >> Gemfile

  bundle
  spring binstub --all
fi

spring stop
rails g
spring status

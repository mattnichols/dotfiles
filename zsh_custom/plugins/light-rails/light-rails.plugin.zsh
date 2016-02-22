alias b='bundle'
alias be="b exec"
alias bx='be'

# rails
alias rc='rails console'
alias rs='rails server'
alias s="bundle exec rspec"
alias migrate="rake db:migrate db:test:prepare"
alias rollback='rake db:rollback'
alias rake='be rake'
alias tlog='tail -f -n 100 log/development.log'
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"

# rubygems
alias gemlist='gem list | cut -d" " -f1'
alias gems-uninstall-all='gemlist | xargs gem uninstall -Iax'
alias gi="gem install"

# RVM
alias mri='rvm use `rvm current | sed "s/^[^@]*\(.*\)/ruby-2.2.1\1/"` --create'
  ## Switch to ruby for current version
alias druby='rvm use `cat .ruby-version`@`cat .ruby-gemset`'

# DevUp shims
alias dup="source ~/.dotfiles/zsh_custom/plugins/light-rails/devup.sh $@"
alias dwn="source ~/.dotfiles/zsh_custom/plugins/light-rails/devdown.sh $@"
alias rails='rails'
alias rspec='bx rspec'
alias guard='bx guard'

alias bundler-multicore='number_of_cores=$(sysctl -n hw.ncpu)&&bundle config --global jobs $((number_of_cores - 1))'

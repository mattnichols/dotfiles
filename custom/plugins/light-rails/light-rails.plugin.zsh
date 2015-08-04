# rails
alias rc='be rails console'
alias rs='be rails server'
alias s="bundle exec rspec"
alias migrate="rake db:migrate db:test:prepare"
alias rollback='rake db:rollback'
alias rake='be rake'
alias tlog='tail -f -n 100 log/development.log'
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"


# ruby
alias gemlist='gem list | cut -d" " -f1'
alias gems-uninstall-all='gemlist | xargs gem uninstall -Iax'
alias gi="gem install"
alias b="bundle"
alias be="bundle exec"
alias bx='bundle exec'
alias mri='rvm use 2.2@${PWD##*/} --create'

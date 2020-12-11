alias b='bundle'
alias be="b exec"
alias bx='be'

# rails
alias rc='rails console'
alias rs='rails server'
alias s="rspec"
alias rake='turbo jitless rake'
alias migrate="rake db:migrate db:test:prepare"
alias rollback='rake db:rollback'
alias tlog='tail -f -n 100 log/development.log'
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"

# JRuby optimizations
alias jitless='JRUBY_OPTS="$JRUBY_OPTS -J-Djruby.compile.mode=OFF"'
alias jit='JRUBY_OPTS="$JRUBY_OPTS -J-Djruby.compile.mode=JIT"'
alias reify='JRUBY_OPTS="$JRUBY_OPTS -J-Djruby.reify.classes=true"'
alias jp='JRUBY_OPTS="$JRUBY_OPTS --profile.api"'
alias turbo='JRUBY_OPTS="$JRUBY_OPTS --dev --client"'

# rubygems
alias gemlist='gem list | cut -d" " -f1'
alias gems-uninstall-all='gemlist | xargs gem uninstall -Iax'
alias gi="gem install"

# RVM
alias mri='rvm use `rvm current | sed "s/^[^@]*\(.*\)/ruby-2.3.1\1/"` --create'
# To switch back... Use
# rvm use .

# DevUp shims
alias dup="source ~/.dotfiles/zsh_custom/plugins/light-rails/devup.sh $@"
alias dwn="source ~/.dotfiles/zsh_custom/plugins/light-rails/devdown.sh $@"

# alias rails='turbo jitless rails'
alias rspec='turbo jitless rspec'
alias rubocop='turbo jitless rubocop'

function wspec() {
  watchman-make --settle 2 --pattern 'app/**/*.rb' 'lib/**/*.rb' 'spec/**/*.rb' --make 'NO_COV=1 time bundle exec rake spec' -t "SPEC=\"$1\""
}

alias bundler-multicore='number_of_cores=$(sysctl -n hw.ncpu)&&bundle config --global jobs $((number_of_cores - 1))'

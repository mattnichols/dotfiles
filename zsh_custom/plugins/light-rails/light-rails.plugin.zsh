# bundler
function bb() {
	if [[ -a "Gemfile.local" ]]; then
		echo "Running Gemfile.local"
		bundle --gemfile=Gemfile.local $*
	else
		echo "You need to run devup command"
	fi
}
alias b='bundle'
alias be="b exec"
alias bx='b exec'

# rails
alias rc='rails console'
alias rs='rails server'
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
alias mri='rvm use `rvm current | sed "s/^[^@]*\(.*\)/ruby-2.2.1\1/"` --create'

# spring
alias devup="source ~/.dotfiles/zsh_custom/plugins/light-rails/devup.sh $@"
alias devdown="rm ./Gemfile.local"

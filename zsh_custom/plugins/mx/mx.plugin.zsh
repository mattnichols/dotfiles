# MX

# Setup
alias mx_setup="source ~/.dotfiles/zsh_custom/plugins/mx/setup.sh $@"

# Protobuf switches
alias nats='PB_CLIENT_TYPE="protobuf/nats/client"'
alias igd='PB_IGNORE_DEPRECATIONS=1'
alias pigd='export igd'

# Rails
alias bx='be'
alias tbx='turbo bx'
alias sbx='super bx'
alias mrs='turbo nats bx rails server'
alias mrc='turbo nats bx rails console'
alias sidekiq_batcave='igd nats sidekiq -q batcave'

echo Ignoring Protobuf Deprecation Warnings...
export PB_IGNORE_DEPRECATIONS=1

echo Skipping Firebolt Warnings...
export FIREBOLT_SKIP_WARNING=1

export PLATOON_PATH=~/code/platoon

alias atlas='c atlas'
alias abacus='c abacus'
alias amigo='c amigo'
alias batcave='c batcave'
alias persona='c persona'
alias synchro='c synchronicity'
alias persona='c persona'

rpc() {
  # nats
  bundle exec rpc_server start ./config/environment.rb
}
alias asub='nats bx action_subscriber start'

kill_rails(){
  lsof -i :3000 | grep 'TCP' | awk '{print $2}' | xargs kill -9
}
kill_zeus(){
  ps | grep 'zeus' | awk '{print $1}' | xargs kill -9 && pkill -f 'zeus'
}

alias sshmux="source ~/.dotfiles/zsh_custom/plugins/mx/sshmux $@"
alias gradle='gw'

# This should not be needed since new macOS has a use keychain option in ~/.ssh/config
# alias ressh="ssh-add -K ~/.ssh/id_rsa"
# ressh

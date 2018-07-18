# MX

# Setup
alias mx_setup="source ~/.dotfiles/zsh_custom/plugins/mx/setup.sh $@"

# Protobuf switches
alias zmq='PB_CLIENT_TYPE=zmq PB_SERVER_TYPE=zmq'
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
alias amigo='c amigo'
alias hawkeye='c hawkeye'
alias persona='c persona'
alias firefly='c firefly'
alias synchro='c synchronicity'
alias persona='c persona'
alias ranger='c ranger'

# alias rpc='PB_CLIENT_TYPE=zmq PB_SERVER_TYPE=zmq bundle exec rpc_server --threads=4 --zmq-inproc --broadcast-beacons --host=`ipaddr` --port=30000 ./config/environment.rb'
rpc() {
  # zmq
  # port=$1
  # [[ $port == "" ]] && port="30000"
  # echo "Starting on port $port"
  # bundle exec rpc_server --threads=4 --zmq-inproc --host=0.0.0.0 --port=$port ./config/environment.rb

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

alias datastream_prod="sshmux ubuntu@52.38.4.15 ubuntu@52.37.225.98 ubuntu@52.25.202.223"
alias ressh="ssh-add -K ~/.ssh/id_rsa"
ressh

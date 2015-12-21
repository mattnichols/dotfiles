# MX

# Setup
alias mx_setup="source ~/.dotfiles/zsh_custom/plugins/mx/setup.sh $@"

# Protobuf switches
alias zmq='PB_CLIENT_TYPE=zmq PB_SERVER_TYPE=zmq'
alias igd='PB_IGNORE_DEPRECATIONS=1'
alias pigd='export igd'

# JRuby optimizations
alias jitless='JRUBY_OPTS="$JRUBY_OPTS -J-Djruby.compile.mode=OFF -J-Djruby.jit.enabled=false"'
alias jit='JRUBY_OPTS="$JRUBY_OPTS -J-Djruby.compile.mode=JIT -J-Djruby.jit.enabled=true"'
alias jp='JRUBY_OPTS="$JRUBY_OPTS --profile.api"'
alias turbo='JRUBY_OPTS="$JRUBY_OPTS --dev"'
alias super='JRUBY_OPTS="--2.0 --dev"'

# Rails
alias bx='be'
alias tbx='turbo bx'
alias sbx='super bx'
alias mrs='turbo zmq bx rails server'
alias mrc='turbo zmq bx rails console'
alias sidekiq_batcave='igd zmq sidekiq -q batcave'

echo Ignoring Protobuf Deprecation Warnings...
export PB_IGNORE_DEPRECATIONS=1

echo Skipping Firebolt Warnings...
export FIREBOLT_SKIP_WARNING=1

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

alias rpc='PB_CLIENT_TYPE=zmq PB_SERVER_TYPE=zmq bundle exec rpc_server --threads=4 --zmq-inproc --broadcast-beacons --host=`ipaddr` --port=30000 ./config/environment.rb'

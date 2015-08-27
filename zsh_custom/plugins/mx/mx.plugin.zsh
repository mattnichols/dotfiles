# MX

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

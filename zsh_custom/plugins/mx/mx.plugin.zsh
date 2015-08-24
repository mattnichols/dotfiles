# MX
alias zmq='PB_CLIENT_TYPE=zmq PB_SERVER_TYPE=zmq'
alias mrs='zmq be rails server'
alias mrc='zmq be rails console'
alias igd='PB_IGNORE_DEPRECATIONS=1'

alias bx='be'

alias sidekiq_batcave='igd zmq sidekiq -q batcave'

alias activate_spring="source ~/.dotfiles/zsh_custom/plugins/mx/activate_spring.sh $@"

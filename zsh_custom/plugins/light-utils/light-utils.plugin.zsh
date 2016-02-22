# Addons
alias -g G='| grep'
alias -g M='| less'
alias -g L='| wc -l'
alias -g ONE="| awk '{ print \$1}'"


# aliases
	# Reload RC
alias ra="source ~/.zshrc"
	# Edit Aliases
alias ea="atom -a ~/.dotfiles ~/.zshrc"


# Directories
unalias ls
alias ls="ls -FG"
alias l='ls -alG'
alias mkdir='mkdir -p'


# Text editor
alias m='atom .'
alias mate='atom'
alias sda='atom -a .'

alias start_mongodb='mongod --config /usr/local/etc/mongod.conf'


# commands starting with % for pasting from web
alias %=' '


# Utils
alias flushdns='dscacheutil -flushcache'
alias add_dock_space="defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}' && killall Dock"
alias uninstall_dotfiles="source ~/.dotfiles/tools/uninstall.sh"
function ipaddr() {
  ifconfig | grep -v "inet 127" | grep "inet \([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\)" | awk -F " " '{print $2}'
}


# Process controls
# Setup
# brew tap homebrew/services
# brew services stop|start postgres...


alias dm='docker-machine'
alias dc='docker-compose'
alias dk='docker'

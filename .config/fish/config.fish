# Fish configuration

set fish_greeting           # Turns off the intro message when pulling up fish shell
set TERM "xterm-256color"   # Sets the terminal type

fish_default_key_bindings
# fish_vi_key_bindings

################################################################################
# "es" Theme title
# https://github.com/oh-my-fish/theme-es/blob/master/fish_title.fish
################################################################################


# set SPACEFISH_RUBY_SYMBOL ""
# set SPACEFISH_RUBY_PREFIX "("
# set SPACEFISH_RUBY_SUFFIX ")"
# set SPACEFISH_DIR_PREFIX ""

function fish_title -d 'Use PROCESS $PWD format, replacing /Users/username with ~'
  set realhome ~
  if test "$_" != "fish"
    echo $_ ''
  else
    echo ''
  end
  string replace -r '^'"$realhome"'($|/)' '~$1' $PWD
end

################################################################################
# end title
################################################################################


################################################################################
# Bob the fish prompt settings
################################################################################

function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

bind ! __history_previous_command
bind '$' __history_previous_command_arguments

## Functions ##

# Run the last command with sudo
function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

function git_sync_tags
  git tag -l | xargs git tag -d
  git fetch --tags
end

# Setup context for kubernetes in sd-qa
function kube_qa
  set -x KUBECONFIG ~/.kube/teleport
  kubectl config use-context qa-sd-qa
end

# Setup context for kubernetes in sd-sand
function kube_sand
  set -x KUBECONFIG ~/.kube/teleport
  kubectl config use-context sand-sb-sand
end

## Abbreviations ##
abbr df 'df -h'
abbr free 'free -g'
abbr h 'cd ~/'
abbr c 'clear'
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr v 'vim'
abbr ll 'ls -l'
abbr la 'ls -A'
abbr lla 'ls -Al'
abbr ls. 'ls -A | egrep "^\."'
abbr merge 'xrdb -merge ~/.Xresources'
abbr q 'exit'
abbr d 'cd ~/Downloads'
abbr doc 'cd ~/Documents'
abbr grep 'grep --color=auto'
abbr egrep 'egrep --color=auto'
abbr fgrep 'fgrep --color=auto'
abbr cp 'cp -i'
abbr mv 'mv -i'
abbr rm 'rm -i'
abbr .c 'cd ~/.config'

abbr st '/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl --stay'
abbr sta '/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl --add'

abbr gs 'git status'
abbr gd 'git diff'
abbr gco 'git checkout'
abbr gb 'git branch'
abbr gnb 'git checkout -b'
abbr gp 'git pull'
abbr gl 'git smart-pull'

abbr b 'bundle install'
abbr bu 'bundle update'
abbr bx 'bundle exec'
abbr c 'z'

alias ea="atom -n ~/"
if command -q eza
  alias ls='eza -la'
end
if command -q trash
  alias rm='trash'
end
alias z='zoxide'

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias vi='nvim'
alias vim='nvim'
alias sshmux="bash ~/tools/sshmux "

# Gradle
alias gradle='gw'
abbr gwl 'gradle dependencies --write-locks'
abbr grd 'gradle dependencies --refresh-dependencies'
abbr grb 'gradle build'
abbr gra 'gradle assemble'
abbr grc 'gradle check'
abbr grt 'gradle test'

#####################
## MX
#####################

# Protobuf switches
alias nats='PB_CLIENT_TYPE="protobuf/nats/client"'
alias igd='PB_IGNORE_DEPRECATIONS=1'
alias pigd='export igd'

# rails
alias rc='rails console'
alias rs='rails server'
alias s="rspec"
#alias rake='turbo jitless rake'
alias migrate="rake db:migrate db:test:prepare"
alias rollback='rake db:rollback'
alias tlog='tail -f -n 100 log/development.log'
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"

# JRuby optimizations
alias jitless='JRUBY_OPTS="$JRUBY_OPTS -J-Djruby.compile.mode=OFF"'
alias jit='JRUBY_OPTS="$JRUBY_OPTS -J-Djruby.compile.mode=JIT"'
alias reify='JRUBY_OPTS="$JRUBY_OPTS -J-Djruby.reify.classes=true"'
alias jp='JRUBY_OPTS="$JRUBY_OPTS --profile.api"'
alias turbo="JRUBY_OPTS='$JRUBY_OPTS --dev --client'"

# rubygems
alias gemlist='gem list | cut -d" " -f1'
alias gems-uninstall-all='gemlist | xargs gem uninstall -Iax'
alias gi="gem install"

# Rails
alias bx='bundle exec'
alias tbx='turbo bx'
alias sbx='super bx'
alias mrs='nats bx rails server'
alias mrc='nats bx rails console'
alias sidekiq_batcave='igd nats sidekiq -q batcave'

alias java17='jabba use openjdk@1.17.0'
alias java8='jabba use adopt@1.8.0-272'

#alias rails='jitless rails'
#alias rspec='jitless rspec'
#alias rubocop='jitless rubocop'

# alias bundler-multicore='number_of_cores=$(sysctl -n hw.ncpu)&&bundle config --global jobs $((number_of_cores - 1))'

echo Ignoring Protobuf Deprecation Warnings...
export PB_IGNORE_DEPRECATIONS=1

echo Skipping Firebolt Warnings...
export FIREBOLT_SKIP_WARNING=1

export HOMEBREW_NO_AUTO_UPDATE=1
export EDITOR=/usr/local/bin/nvim
export XDG_CONFIG_HOME=$HOME/.config/
alias nvim='NVIM_APPNAME=kickstart /usr/local/bin/nvim'

set PATH "$HOME/bin:/usr/local/bin:$PATH"

# Hack to keep git cert registered
# ssh-add -K ~/.ssh/id_ed25519
if status is-interactive
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519
end

# navi widget fish | source

if status is-interactive
  neofetch --ascii ~/.config/neofetch/tie_fighter.ascii
end

#colorscript -e tiefighter1row
# rvm default
export GOBIN="$HOME/go/bin"
set PATH "bin:$HOME/.rbenv/shims:$GOBIN:$PATH"

if status is-interactive && command -q pyenv
  pyenv init - | source
end

if status is-interactive && test -e "$HOME/.jabba"
  [ -s "/Users/matthew.nichols/.jabba/jabba.fish" ]; and source "/Users/matthew.nichols/.jabba/jabba.fish"
end

function __handle_jabba_stuff --on-variable PWD
  # Source a .jabbarc file in a directory after changing to it, if it exists.
  set -l cwd $PWD
  if test -e .jabbarc
    eval "jabba use" > /dev/null
  else
    jabba use default 1>/dev/null 2>&1
    set cwd (dirname "$cwd")
  end

  set -e cwd
end

function nvims
  set options "default" "kickstart" "LazyVim" "nvchad"
  set config (printf "%s\n" $options | fzf --prompt=" Neovim Config  " --height="50%"  --layout=reverse --border --exit-0)

  if test -z $config
    echo "Nothing selected"
    return 0
  else if test "$config" = "default"
    set config "kickstart"
  end
  NVIM_APPNAME="$config" /usr/local/bin/nvim $argv
end

if status is-interactive && command -q starship
  starship init fish | source
end

if command -q fzf
  fzf --fish | source
end

if command -q zoxide
  zoxide init fish | source
end


# Fish configuration

set fish_greeting # Turns off the intro message when pulling up fish shell
set TERM xterm-256color # Sets the terminal type

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
    if test "$_" != fish
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
            commandline -t $history[1]
            commandline -f repaint
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
abbr c clear
abbr .. 'cd ..'
abbr ... 'cd ../..'
alias ls="eza --color=always --git --icons=always"
abbr merge 'xrdb -merge ~/.Xresources'
abbr q exit
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

alias ea="nvim ~/"

if command -q eza
    alias ls='eza -la'
end
abbr ll 'ls --long'
abbr la 'ls -A'
abbr lla 'ls -A --long'
abbr ls. 'ls -A | egrep "^\."'

if command -q trash
    alias rm='trash'
end

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias sshmux="bash ~/tools/sshmux "
alias fzf-tmux="bash ~/tools/fzf-tmux "

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

export NVIMEX=(which nvim)

export EDITOR="$NVIMEX"
export XDG_CONFIG_HOME=$HOME/.config/

alias nvim="NVIM_APPNAME=kickstart $NVIMEX"

set PATH "$HOME/bin:/usr/local/bin:$PATH"

# Hack to keep git cert registered
# ssh-add -K ~/.ssh/id_ed25519
if status is-interactive && command -q ssh-add && test -e /usr/local/bin/nvim
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
    [ -s "$HOME/.jabba/jabba.fish" ]; and source "$HOME/.jabba/jabba.fish"
    export JABBA_INSTALLED=1
end

function __handle_jabba_stuff --on-variable PWD
    if not test -e $JABBA_INSTALLED
        return
    end 

    # Source a .jabbarc file in a directory after changing to it, if it exists.
    set -l cwd $PWD
    if test -e .jabbarc
        eval "jabba use" >/dev/null
    else
        jabba use default 1>/dev/null 2>&1
        set cwd (dirname "$cwd")
    end

    set -e cwd
end

function touche
    touch $argv[1]
    chmod +x $argv[1]
end

function nvims
    set options default kickstart LazyVim nvchad
    set config (printf "%s\n" $options | fzf --prompt=" Neovim Config = " --height="50%"  --layout=reverse --border --exit-0)

    if test -z $config
        echo "Nothing selected"
        return 0
    else if test "$config" = default
        set config kickstart
    end
    NVIM_APPNAME="$config" $NVIMEX $argv
end


# if command -q zoxide
#     zoxide init fish | source
# end

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd
    builtin pwd -L
end

# A copy of fish's internal cd function. This makes it possible to use
# `alias cd=z` without causing an infinite loop.
if ! builtin functions --query __zoxide_cd_internal
    if builtin functions --query cd
        builtin functions --copy cd __zoxide_cd_internal
    else
        alias __zoxide_cd_internal='builtin cd'
    end
end

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd
    __zoxide_cd_internal $argv
end

# =============================================================================
#
# Hook configuration for zoxide.
#

# Initialize hook to add new entries to the database.
function __zoxide_hook --on-variable PWD
    test -z "$fish_private_mode"
    and command zoxide add -- (__zoxide_pwd)
end

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

if test -z $__zoxide_z_prefix
    set __zoxide_z_prefix 'z!'
end
set __zoxide_z_prefix_regex ^(string escape --style=regex $__zoxide_z_prefix)

# Jump to a directory using only keywords.
function __zoxide_z
    set -l argc (count $argv)
    if test $argc -eq 0
        __zoxide_cd $HOME
    else if test "$argv" = -
        __zoxide_cd -
    else if test $argc -eq 1 -a -d $argv[1]
        __zoxide_cd $argv[1]
    else if set -l result (string replace --regex $__zoxide_z_prefix_regex '' $argv[-1]); and test -n $result
        __zoxide_cd $result
    else
        set -l result (command zoxide query --exclude (__zoxide_pwd) -- $argv 2>/dev/null)
        and __zoxide_cd $result
    end
end

# Completions.
function __zoxide_z_complete
    set -l tokens (commandline --current-process --tokenize)
    set -l curr_tokens (commandline --cut-at-cursor --current-process --tokenize)

    if test (count $tokens) -le 2 -a (count $curr_tokens) -eq 1
        # If there are < 2 arguments, use `cd` completions.
        complete --do-complete "'' "(commandline --cut-at-cursor --current-token) | string match --regex '.*/$'
    else if test (count $tokens) -eq (count $curr_tokens); and ! string match --quiet --regex $__zoxide_z_prefix_regex. $tokens[-1]
        # If the last argument is empty and the one before doesn't start with
        # $__zoxide_z_prefix, use interactive selection.
        set -l query $tokens[2..-1]
        set -l result (zoxide query --exclude (__zoxide_pwd) --interactive -- $query 2>/dev/null)
        and echo $__zoxide_z_prefix$result
        commandline --function repaint
    end
end
complete --command __zoxide_z --no-files --arguments '(__zoxide_z_complete)'

# Jump to a directory using interactive search.
function __zoxide_zi
    set -l result (command zoxide query --interactive -- $argv)
    and __zoxide_cd $result
end

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

abbr --erase z &>/dev/null
alias z=__zoxide_z

abbr --erase zi &>/dev/null
alias zi=__zoxide_zi

abbr c z

if status is-interactive && command -q starship
    starship init fish | source
end

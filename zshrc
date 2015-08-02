# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# use mate as an editor
export EDITOR=mate

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# config
if [ -e "$HOME/.configure" ]; then
  source "$HOME/.configure"
fi

export NODE_PATH="/usr/local/lib/node/"

export PATH=/usr/local/share/npm/bin:$PATH

##################################################
# See other keybinding options here:
# http://www.cs.elte.hu/zsh-manual/zsh_14.html

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"
bindkey "^K" kill-line

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# look for ey config in project dirs
export EYRC=./.eyrc

# awesome cd movements from zshkit
# automatically enter directories without cd
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt CDABLEVARS
export dirstacksize=5

# Try to correct command line spelling
#setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

# RVM
# [[ -s "/Volumes/HD/Home/.rvm/scripts/rvm" ]] && source "/Volumes/HD/Home/.rvm/scripts/rvm"

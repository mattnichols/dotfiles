# Query/use custom command for `git`.
zstyle -s ":vcs_info:git:*:-all-" "command" _omz_git_git_cmd
: ${_omz_git_git_cmd:=git}

#
# Functions
#

# The current branch name
# Usage example: git pull origin $(current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function current_branch() {
  local ref
  ref=$($_omz_git_git_cmd symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$($_omz_git_git_cmd rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}
# The list of remotes
function current_repository() {
  if ! $_omz_git_git_cmd rev-parse --is-inside-work-tree &> /dev/null; then
    return
  fi
  echo $($_omz_git_git_cmd remote -v | cut -d':' -f 2)
}
# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
# Warn if the current branch is a WIP
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}

# Aliases
alias gf='git fetch origin --prune'
alias gl='git smart-pull'
alias gp='git push'
alias gph='git push heroku'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias gnb='git checkout -b'
alias gs='git status'
alias ga='git add .'
alias grm="git ls-files --deleted | xargs git rm -f"
function gc() {
  git commit -v -m "$*"
}
function gca() {
  git commit -v -a -m "$*"
}
alias git_purge="git reset --hard&&git clean -f&&git checkout master&&gf&&gl"

# Require git-smart gem
alias gup='git smart-pull'
alias gg='git smart-log'

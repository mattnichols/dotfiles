# function _rake_command () {
#   if [ -e "bin/rake" ]; then
#     bin/rake $@
#   else
#     command rake $@
#   fi
# }

# alias rails='_rails_command'
# compdef _rails_command=rails

# alias rake='_rake_command'
# compdef _rake_command=rake

function mssh() {
  echo -ne "\e]1;$1\a"
  /usr/bin/ssh matthew.nichols@$1
}

# alias mssh='_mssh'
# compdef _mssh=mssh

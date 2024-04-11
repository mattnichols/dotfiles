#! /usr/local/bin/fish

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

fisher install franciscolourenco/done # Notify desktop when longrunning task finishes
fisher install PatrickF1/fzf.fish     # Fuzzy find for fish
fisher install jethrokuan/z

#omf install es
#omf install scorphish
#omf install spacefish
omf install bobthefish

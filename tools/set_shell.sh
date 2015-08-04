#!/bin/sh

TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
    echo "\033[0;34mTime to change your default shell to zsh!\033[0m"
    chsh -s $(grep /zsh$ /etc/shells | tail -1)
fi
unset TEST_CURRENT_SHELL

echo "Restart Terminal and run setup script"
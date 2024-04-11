#!/bin/sh

TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$TEST_CURRENT_SHELL" != "fish" ]; then
    echo "\033[0;34mTime to change your default shell to fish!\033[0m"
    chsh -s $(grep /fish$ /etc/shells | tail -1)
fi
unset TEST_CURRENT_SHELL

echo "Restart Terminal and run setup script"

#! /bin/sh

launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist

brew uninstall zeromq3
brew uninstall zeromq

brew uninstall mongodb
brew uninstall redis
brew uninstall postgresql
brew uninstall rabbitmq
brew uninstall protobuf
brew uninstall imagemagick
brew uninstall ansible
brew uninstall ant

#! /bin/sh

# MX Setup script
brew install mongodb
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

brew install redis
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

brew install postgresql
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

brew install rabbitmq
ln -sfv /usr/local/opt/rabbitmq/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist

brew install zeromq
brew install protobuf
brew install imagemagick
brew install ansible
brew install ant

# This once solved an issue running batcave locally. Doesn't seem to work anymore.
# brew uninstall zeromq
# brew install homebrew/versions/zeromq3
# ln -s /usr/local/opt/zeromq3/lib/*.dylib /usr/local/lib/

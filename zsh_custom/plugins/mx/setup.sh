#! /bin/sh

# MX Setup script

brew uninstall zeromq
brew install homebrew/versions/zeromq3

brew install mongodb
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

brew install redis

brew install postgresql
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

brew install rabbitmq
brew install protobuf
brew install imagemagick

ln -s /usr/local/opt/zeromq3/lib/*.dylib /usr/local/lib/

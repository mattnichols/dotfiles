#! /bin/sh

# MX Setup script

brew uninstall zeromq && brew install homebrew/versions/zeromq3
brew install mongodb
brew install redis
brew install postgresql
brew install rabbitmq
brew install protobuf
brew install imagemagick

ln -s /usr/local/opt/zeromq3/lib/*.dylib /usr/local/lib/

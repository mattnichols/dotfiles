!# /bin/sh bash

if test "$(uname)" = "Darwin"

  # brew cask install java
  # brew cask install jce-unlimited-strength-policy
  
  brew install protobuf

  brew install nats-server
  brew services start postgresql@14
  
  brew install redis
  brew services start postgresql@14

  brew install rabbitmq
  brew services start rabbitmq

  brew install postgresql
  brew services start postgresql@14
  # TODO: set permissions for postgresql
  initdb /usr/local/var/postgres -E utf8 --locale=C
  psql postgres -c 'CREATE EXTENSION "adminpack";' # Not sure I need this...
  createuser -s postgres

else if test "$(expr substr $(uname -s) 1 5)" = "Linux"
end

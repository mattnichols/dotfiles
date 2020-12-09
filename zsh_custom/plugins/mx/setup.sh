#! /bin/sh

# MX Setup script
brew install nats-server
brew services start nats-server

brew install redis
brew services start redis

brew install postgresql
sudo rm -rf /usr/local/var/postgres && initdb /usr/local/var/postgres
brew services start postgresql

pause 10

# Cleanup and re-init database
initdb /usr/local/var/postgres -E utf8
psql postgres -c 'CREATE EXTENSION "adminpack";' # Not sure I need this...
createuser -s postgres

brew install rabbitmq
brew services start rabbitmq

brew install protobuf
brew install ansible
brew install ant
brew install gdub # Gradlew wrapper

brew install fish

brew install bat # Improved cat (with syntax highlighting)
brew install fd  # Improved find
brew install fzf # Fuzzy Find
brew install terminal-notifier # Send desktop notifications from terminal

fisher install franciscolourenco/done # Notify desktop when longrunning task finishes
fisher install PatrickF1/fzf.fish     # Fuzzy find for fish

# brew install imagemagick
# brew install tmux
# brew install mockserver # Used for mocking/proxying/replaying external resources

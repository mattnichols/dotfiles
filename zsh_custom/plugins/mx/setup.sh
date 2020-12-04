#! /bin/sh

# MX Setup script
brew install redis
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

#chown -R `whoami` /usr/local
#chown -R `whoami` /var

brew install postgresql
rm -rf /usr/local/var/postgres && initdb /usr/local/var/postgres
mkdir /var/pgsql_socket/
ln -s /private/tmp/.s.PGSQL.5432 /var/pgsql_socket/
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

pause 10

# Cleanup and re-init database
rm -R /usr/local/var/postgres
initdb /usr/local/var/postgres -E utf8
psql postgres -c 'CREATE EXTENSION "adminpack";' # Not sure I need this...
createuser -s postgres

brew install rabbitmq
ln -sfv /usr/local/opt/rabbitmq/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist

brew install protobuf
# brew install imagemagick
# brew install ansible
# brew install ant
# brew install tmux
# brew install mockserver # Used for mocking/proxying/replaying external resources

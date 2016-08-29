#! /bin/sh

# MX Setup script
brew install mongodb
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

brew install redis
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

chown -R `whoami` /usr/local
chown -R `whoami` /var

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
brew install imagemagick
brew install ansible
brew install ant
brew install tmux

# brew install zeromq
# Cannot use latest zermq brew.
#   Brew install of zeromq does not work with ffi-rzmq (gem) ??

cd /usr/local
mkdir src
cd /usr/local/src
wget https://archive.org/download/zeromq_4.1.5/zeromq-4.1.5.tar.gz
tar -xvf zeromq-4.1.5.tar.gz
cd zeromq-4.1.5
./autogen.sh && ./configure && make -j 4
make check && make install

# This once solved an issue running batcave locally. Doesn't seem to work anymore.
# brew uninstall zeromq
# brew install homebrew/versions/zeromq32
# ln -s /usr/local/opt/zeromq32/lib/*.dylib /usr/local/lib/

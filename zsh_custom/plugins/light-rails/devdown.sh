#! /bin/sh

mri

sed '/DEVUP--/,/--DEVUP/d' ./Gemfile > ~/.tmpfile && mv ~/.tmpfile "./Gemfile"

ul .ruby-version
mv .ruby-version.orig .ruby-version
rvm use .

git checkout Gemfile.lock -f

bundle install
git checkout .gitignore
git clean -f ./cache
git clean -f ./vendor
rvm use .

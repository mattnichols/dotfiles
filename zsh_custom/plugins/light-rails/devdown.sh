#! /bin/sh

mri

sed '/DEVUP--/,/--DEVUP/d' ./Gemfile > ~/.tmpfile && mv ~/.tmpfile "./Gemfile"

git checkout Gemfile.lock -f

bundle install
git checkout .gitignore
git clean -f ./cache
git clean -f ./vendor

#! /bin/sh

mri

sed '/DEVUP--/,/--DEVUP/d' ./Gemfile > ~/.tmpfile && mv ~/.tmpfile "./Gemfile"
rm ./Gemfile.local* NE

bundle install
git checkout .gitignore
git clean -f ./cache

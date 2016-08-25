# Install ruby called for by current directory's .ruby-version file
function rvmi() {
  rvm install `cat .ruby-version`
  rvm use .
  gem install bundler
  bundle install
}
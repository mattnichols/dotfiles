# ActiveRecord::Base.logger = Logger.new(STDOUT)
begin
  require "awesome_print"
  AwesomePrint.pry!
rescue LoadError => err
  warn "Unable to load awesome_print: #{err} (run: rvm @global do gem install awesome_print)"
end

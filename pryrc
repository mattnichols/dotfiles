# ActiveRecord::Base.logger = Logger.new(STDOUT)
begin
  require "awesome_print"
  AwesomePrint.pry!
rescue LoadError => err
  warn "Unable to load awesome_print: #{err} (run: rvm @global do gem install awesome_print)"
end

begin
  require 'pry-clipboard'
  # aliases
  Pry.config.commands.alias_command 'ch', 'copy-history'
  Pry.config.commands.alias_command 'cr', 'copy-result'
rescue LoadError => e
  warn "can't load pry-clipboard"
end

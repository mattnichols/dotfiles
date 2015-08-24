require 'irb/completion'
require 'irb/ext/save-history'

require 'pp'
require 'rubygems'


IRB.conf[:SAVE_HISTORY] = 200
# IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb/history"
IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:AUTO_INDENT]  = true


begin
  require 'wirble'

  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Unable to load Wirble: #{err} (run: rvm @global do gem install wirble)"
end



### Rails
# Some features that make using irb for rails much nicer.
if rails_env = ENV['RAILS_ENV']
  rails_root = File.basename(Dir.pwd)
  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS] = {
    :PROMPT_I => "#{rails_root}##{rails_env}> ",
    :PROMPT_S => "#{rails_root}* ",
    :PROMPT_C => "#{rails_root}? ",
    :RETURN   => "=> %s\n"
  }
  IRB.conf[:PROMPT_MODE] = :RAILS

  # Called after the irb session is initialized and Rails has
  # been loaded (props: Mike Clark).
  IRB.conf[:IRB_RC] = Proc.new do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.instance_eval { alias :[] :find }
  end
end


## Handy shortcuts
def ls
   %x{ls}.split("\n")
end

def time(cnt = 1)
  now = Time.now.to_f
  cnt.times do
    yield
  end
  endd = Time.now.to_f
  endd - now
end

## find source location of method
# Usage: where?(::Account, :by_fields), where?(Account.first, :id)
def where?(obj, meth_sym)
  obj.method(meth_sym).source_location
end


## Notify us of the version and that it is ready.
puts "Ruby #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL} (#{RUBY_RELEASE_DATE}) #{RUBY_PLATFORM}"

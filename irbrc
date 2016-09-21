require 'irb/completion'
require 'irb/ext/save-history'

require 'pp'
require 'rubygems'


IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb/history"
IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:AUTO_INDENT]  = true

begin
  require "awesome_print"
  AwesomePrint.irb! # just in .irbrc
rescue LoadError => err
  warn "Unable to load awesome_print: #{err} (run: rvm @global do gem install awesome_print)"
end


### Rails
# Some features that make using irb for rails much nicer.
if Object.const_defined?('Rails')
  rails_root = Rails.root.basename.to_s
  rails_env = Rails.env
  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS] = {
    :PROMPT_I => "#{rails_root}##{rails_env} >> ",
    :PROMPT_S => "#{rails_root}* ",
    :PROMPT_C => "#{rails_root}? ",
    :RETURN   => "=> %s\n"
  }
  IRB.conf[:PROMPT_MODE] = :RAILS

  # This isn't working...
  # Called after the irb session is initialized and Rails has
  # been loaded (props: Mike Clark).
  # IRB.conf[:IRB_RC] = Proc.new do
    # ActiveRecord::Base.logger = Logger.new(STDOUT)
    # ActiveRecord::Base.instance_eval { alias :[] :find }
  # end
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

class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

    # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    system 'ri', method.to_s
  end
end

class Hash
  def to_query
    q = self.map do |k, v|
      "#{k.gsub("-","_")}=#{v}"
    end.join("&")

    URI.escape(q)
  end
end

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def copy_history
  history = Readline::HISTORY.entries
  index = history.rindex("exit") || -1
  content = history[(index+1)..-2].join("\n")
  puts content
  copy content
end

def paste
  `pbpaste`
end

@account_guid = "ACT-f717187e-4c35-4cac-682c-e8d7fa704661"
@user_guid = "USR-af8a898d-fc44-2d8d-57b4-482b9a4d2552"
@institution_guid = "INS-MANUAL-cb5c-1d48-741c-b30f4ddd1730"
@member_guid = "MBR-bbbf731d-85d0-6478-2a39-cb26e875a4ba"

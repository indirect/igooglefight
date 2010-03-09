begin
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  raise LoadError, "Cannot load .bundle/environment.rb. Did you run `bundle lock`?"
end

require 'igooglefight'
run IGoogleFight

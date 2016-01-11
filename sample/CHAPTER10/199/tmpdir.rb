require 'tmpdir'
Dir.tmpdir                       # => "/tmp"
File.join(Dir.tmpdir, "foo.rb")  # => "/tmp/foo.rb"

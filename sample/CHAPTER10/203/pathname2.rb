require 'pathname'
# Fileのクラスメソッドを使った場合
p = "/tmp/test.txt"
File.open(p, "w") {|f| f.print "123\n456\n" }
File.directory?(p) # => false
File.read(p)       # => "123\n456\n"
File.readlines(p)  # => ["123\n", "456\n"]
File.writable?(p)  # => true
File.chmod(0400,p) # => 1
File.writable?(p)  # => false
File.delete(p)     # => 1
File.exist?(p)     # => false
# Pathnameを使った場合
p = Pathname "/tmp/test.txt"
p.open("w") {|f| f.print "123\n456\n" }
p.directory?       # => false
p.read             # => "123\n456\n"
p.readlines        # => ["123\n", "456\n"]
p.writable?        # => true
p.chmod 0400       # => 1
p.writable?        # => false
p.delete           # => 1
p.exist?           # => false


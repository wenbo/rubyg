require 'pathname'
open("/tmp/foo.txt","w"){}      # nodisp
open("/tmp/bar.txt","w"){}      # nodisp
Dir.chdir "/tmp"
# File�Υ��饹�᥽�åɤ�Ȥä����
p = "foo.txt"                          # => "foo.txt"
File.expand_path(p)                    # => "/tmp/foo.txt"
d = File.dirname(File.expand_path(p))  # => "/tmp"
pr = File.join(d, "bar.txt")           # => "/tmp/bar.txt"
File.split(pr)                         # => ["/tmp", "bar.txt"]
# Pathname��Ȥä����
p = Pathname "foo.txt"                 # => #<Pathname:foo.txt>
p.expand_path                          # => #<Pathname:/tmp/foo.txt>
d = p.expand_path.dirname              # => #<Pathname:/tmp>
pr = d.join "bar.txt"                  # => #<Pathname:/tmp/bar.txt>
pr.split                               # => [#<Pathname:/tmp>, #<Pathname:bar.txt>]

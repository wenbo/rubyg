require 'pathname'
pwd = Pathname.pwd                         # => #<Pathname:/tmp>
# Dir.foreach(pwd) ����
pwd.each_entry {|path| break path }        # => #<Pathname:.>
# Find.find(pwd) ����
pwd.find {|path| break path }              # => #<Pathname:/tmp>
# Dir.glob("*.rd") ����
Pathname.glob("*.rb") {|path| break path}  # => #<Pathname:a.rb>
# �����ȥǥ��쥯�ȥ���κǸ�Υե����������
Pathname.pwd.children.last                 # => #<Pathname:/tmp/.X11-unix>
Pathname.pwd.children(false).last          # => #<Pathname:.X11-unix>

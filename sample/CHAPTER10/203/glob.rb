require 'pathname'
pwd = Pathname.pwd                         # => #<Pathname:/tmp>
# Dir.foreach(pwd) 相当
pwd.each_entry {|path| break path }        # => #<Pathname:.>
# Find.find(pwd) 相当
pwd.find {|path| break path }              # => #<Pathname:/tmp>
# Dir.glob("*.rd") 相当
Pathname.glob("*.rb") {|path| break path}  # => #<Pathname:a.rb>
# カレントディレクトリ内の最後のファイルを得る
Pathname.pwd.children.last                 # => #<Pathname:/tmp/.X11-unix>
Pathname.pwd.children(false).last          # => #<Pathname:.X11-unix>

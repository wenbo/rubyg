open("taint.rb") do |io|
# ファイルの中身は汚染されている。
  s = io.read
  s.tainted?         # => true
# 内部のオブジェクトは汚染されていない。
  t = "!"
  t.tainted?         # => false
# 汚染は伝播する。
  (s + t).tainted?   # => true
end
# 環境変数は汚染されている。
ENV['USER'].tainted? # => true
# 環境変数PATHだけは特別で、誰でも書き込めるディレクトリが含まれていない場合は汚染されていない。
ENV['PATH'].tainted? # => false
# しかし、誰でも書き込めるディレクトリを含めたら汚染される。警告も出る。
ENV['PATH'] += ":/tmp" # !> Insecure world writable dir /tmp in PATH, mode 041777
ENV['PATH'].tainted? # => true
# ((:Object#taint:))でオブジェクトを汚染させる。
s = "xxx".taint      # => "xxx"
s.tainted?           # => true
# ((:Object#untaint:))でオブジェクトを浄化（汚染マークを取り除く）する。
s.untaint            # => "xxx"
s.tainted?           # => false
# freezeされたオブジェクトは汚染マークの変更もできない。
s.freeze             # => "xxx"
s.taint rescue $!    # => #<TypeError: can't modify frozen object>

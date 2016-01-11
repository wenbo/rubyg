# 外側のローカル変数に対する挙動
outer = :outer
# メソッドは外側のローカル変数が見えない。
def meth()  outer rescue $!  end
meth  # => #<NameError: undefined local variable or method `outer' for main:Object>
[1].each do |x|
  outer  # => :outer
end
# ブロック付きメソッドのように外部のローカル変数が見える。
f = lambda do
  outer  # => :outer
end
f.call   # => :outer
# 同じ処理を複数の場所に書く場合
def cat(x)
# 同じ処理を複数の場所に書く場合は、Procを定義してそれを呼ぶとDRY原則を守れる。
  action = lambda { puts "<#{x}> Meow" }
  action.call if x == 1
  action.call if x < 3
end
cat 0
cat 1
# >> <0> Meow
# >> <1> Meow
# >> <1> Meow

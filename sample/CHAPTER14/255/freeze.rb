# 3要素が同一オブジェクトの配列の要素に破壊的メソッドを適用すると、全要素が変更されてしまう。
ary = Array.new(3, "a")         # => ["a", "a", "a"]
ary[0].replace "A"
ary                             # => ["A", "A", "A"]
# それを防ぐためには、オブジェクトを変更不可にする。
ary = Array.new(3, "a".freeze)  # => ["a", "a", "a"]
ary[0].frozen?                  # => true
# 変更しようとしたら例外が発生するので、意図しない書き換えからプログラムを守る。Ruby 1.8ではTypeError、Ruby 1.9ではRuntimeErrorとなる。
ary[0].replace "A" rescue $!    # => #<RuntimeError: can't modify frozen string>

a = [3, 1, 2, 1, 4, 1]
# 要素数を数える。
a.count                        # => 6
# 3以上の要素数を数える。両者は等価。
a.count {|x| x >= 3 }          # => 2
a.select {|x| x >= 3 }.length  # => 2
a.count {|x| x > 9 }           # => 0
# 奇数の要素数を数える。
a.count(&:odd?)                # => 4
# 1が何個あるか数える。両者は等価。
a.count(1)                     # => 3
a.grep(1).length               # => 3
a.count(9)                     # => 0

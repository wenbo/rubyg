ary = [1, 2, 3]
hash = {:one => 1, :two => 2}
# 配列・ハッシュともに「length」・「size」メソッドでサイズが求まる。
ary.length                  # => 3
ary.size                    # => 3
hash.length                 # => 2
hash.size                   # => 2
# ネストされた配列は外側のサイズとなる。
nested = [[1,2], [3,4,5]]
nested.length               # => 2
# ちなみにネストされたものも含め全要素を求めるには、平滑化した配列のサイズを求める。
nested.flatten              # => [1, 2, 3, 4, 5]
nested.flatten.length       # => 5
# 内側の配列のサイズをすべて得るには((:Enumerable#map:))と併用する。
nested.map{|ia| ia.length}  # => [2, 3]
# 空配列・空ハッシュのサイズは0。
[].length                   # => 0
{}.length                   # => 0

ary = %w[a b]
# 整数と乗算すると繰り返しになる。
repeated = ary * 3         # => ["a", "b", "a", "b", "a", "b"]
# Ruby 1.8.7以降だと((:Array#cycle:))も使える。
ary.cycle(3).to_a          # => ["a", "b", "a", "b", "a", "b"]
# 文字列と乗算すると要素の間に文字列をはさんだ文字列が返る。((:Array#join:))と同じ。
ary * ":"                  # => "a:b"
# 要素はコピーされない。
ary[0].equal? repeated[0]  # => true
ary[0].equal? repeated[2]  # => true
# だから破壊的メソッドを適用すると大変なことになる。
repeated[0].upcase!
repeated                   # => ["A", "b", "A", "b", "A", "b"]
ary                        # => ["A", "b"]

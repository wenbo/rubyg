# 1〜5の偶数と奇数を個別に求める。
(1..5).select{|n| n%2 == 0 }     # => [2, 4]
(1..5).reject{|n| n%2 == 0 }     # => [1, 3, 5]
# 同時に求めるには「partition」メソッドを使う。
(1..5).partition{|n| n%2 == 0 }  # => [[2, 4], [1, 3, 5]]
# Ruby 1.8.7以降ではこのようにも書ける。
(1..5).partition(&:even?)        # => [[2, 4], [1, 3, 5]]

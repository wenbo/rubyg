ary = [12,24,83,61]
# 「Enumerable#min」で最小値を求める。
ary.min                        # => 12
# 「Enumerable#max」で最大値を求める。
ary.max                        # => 83
# 1の位の最小になる数を求める。
ary.min{|a,b| a%10 <=> b%10 }  # => 61
# Ruby 1.8.7以降では「Enumerable#minmax」で最小値・最大値を同時に求められる。
ary.minmax                     # => [12, 83]
# Ruby 1.8.7以降では「Enumerable#min_by」、「Enumerable#max_by」、「Enumerable#minmax_by」が使える。1の位（n%10）の最小値・最大値を求める。
ary.min_by{|n| n%10 }          # => 61
ary.max_by{|n| n%10 }          # => 24
ary.minmax_by{|n| n%10 }       # => [61, 24]

# 偶数であるかを判定するInteger#even?を使う。
(1..10).find(&:even?)                           # => 2
a = %w[fire thunder Ice Water]
# 要素とインデックスを同時に求めるには「.each_with_index」をはさむだけ。
a.each_with_index.detect{|s,i| s =~ /^[A-Z]/ }  # => ["Ice", 2]
# 大文字から始まる最初の要素のインデックスを求める。
a.index{|s| s =~ /^[A-Z]/ }                     # => 2
# 大文字から始まる最後の要素のインデックスを求める。
a.rindex{|s| s =~ /^[A-Z]/ }                    # => 3

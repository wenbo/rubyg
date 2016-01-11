# 1〜10で最初の偶数（n%2 == 0）を求める。
(1..10).find{|n| n%2 == 0 }                     # => 2
a = %w[fire thunder Ice Water]
# 大文字から始まる最初の要素を求める。「Enumerable#detect」は「Enumerable#find」の別名。
a.detect{|s| s =~ /^[A-Z]/ }                    # => "Ice"
# 要素とインデックスを同時に求める。
require 'enumerator'
a.enum_for(:each_with_index).detect{|s,i| s =~ /^[A-Z]/ }  # => ["Ice", 2]
# a>10を満たす最初のペアを求める。
pairs = [[7,"fire"], [10,"thunder"], [11, "ice"], [18, "water"]]
pairs.find{|x,y| x>10 }                         # => [11, "ice"]

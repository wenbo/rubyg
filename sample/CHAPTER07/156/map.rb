# 各要素の二乗を求める。
[1,3,9,10].map{|x| x**2 }        # => [1, 9, 81, 100]
(1..10).map{|x| x**2}            # => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
# 各要素について二乗、三乗を求める。
(1..3).map{|x| [x, x**2, x**3]}  # => [[1, 1, 1], [2, 4, 8], [3, 9, 27]]

ary2 = [[:one, 1], [:two, 2], [:three, 3]]
# ネストした配列の最初の要素を集める。Ruby 1.8.7以降では((:String#to_proc:))による短縮機能が使える。
ary2.map{|x| x.first }  # => [:one, :two, :three]
ary2.map(&:first)       # => [:one, :two, :three]
# ネストした配列の<%=idx 1 %>の要素を集める。ブロックパラメータは多重代入に似たルールで分割できるため、ネストした配列が扱いやすくなる。
ary2.map{|x| x[1] }     # => [1, 2, 3]
ary2.map{|x,y| y }      # => [1, 2, 3]
# 各要素を全部小文字にする。
%w[Japan USA CHINA].map{|s| s.downcase }  # => ["japan", "usa", "china"]
%w[Japan USA CHINA].map(&:downcase)       # => ["japan", "usa", "china"]

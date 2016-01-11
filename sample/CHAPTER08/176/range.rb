# 1以上4以下の範囲を作成する。
r1 = 1..4             # => 1..4
# 最初の要素は1と最後の要素は4。終点を含む。
[r1.first, r1.last, r1.exclude_end?]  # => [1, 4, false]
[r1.begin, r1.end]    # => [1, 4]
# 配列化する。
r1.to_a               # => [1, 2, 3, 4]
# 合計を求める。後者はRuby 1.8.7以降のみ。
r1.inject{|s,x| s+x}  # => 10
r1.inject(:+)         # => 10
# 1以上4未満の範囲を作成する。
r2 = 1...4            # => 1...4
# 最初の要素は1と最後の要素は4。終点を含まない。
[r2.first, r2.last, r2.exclude_end?]  # => [1, 4, true]
# 終点を含まないので、要素がひとつ減る。
r2.to_a            # => [1, 2, 3]
# 最初の要素の方が大きい範囲を作成することはできるが、空の範囲になるので注意。[4,3,2,1]にはならない。
r3 = 4..1          # => 4..1
r3.to_a            # => []
# [4,3,2,1]を得るには1..4を配列化してから反転する。
r1.to_a.reverse    # => [4, 3, 2, 1]
# 始点・終点に文字列も指定できる。
r4 = "a" .. "d"    # => "a".."d"
r4.to_a            # => ["a", "b", "c", "d"]
r5 = "01" .. "05"  # => "01".."05"
r5.to_a            # => ["01", "02", "03", "04", "05"]
# 始点・終点にTimeも指定できる。
now = Time.now
r6 = now .. now+1
# => 2008-11-10 05:26:47 +0900..2008-11-10 05:26:48 +0900
r6.to_a
# => [2008-11-10 05:26:47 +0900, 2008-11-10 05:26:48 +0900]
# 始点・終点にDateも指定できる。
require 'date'
r7 = Date.new(1993,2,24) .. Date.new(1993,2,25)
# => #<Date: 4898085/2,0,2299161>..#<Date: 4898087/2,0,2299161>
r7.to_a.map {|x| x.to_s }  # => ["1993-02-24", "1993-02-25"]

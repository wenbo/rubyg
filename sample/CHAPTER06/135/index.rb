# index 0 1 2 3 4 5
nums = [7,5,9,8,9,1]
# 最大値と最小値を求める。
max = nums.max   # => 9
min = nums.min   # => 1
# 最大値9は2箇所あるが、Array#indexは最初のインデックスを、Array#rindexは最後のインデックスを求める。
nums.index max   # => 2
nums.rindex max  # => 4
# 最小値1は1箇所しかないので、両者は同じ値になる。
nums.index min   # => 5
nums.rindex min  # => 5
# numsに存在しないオブジェクトを指定した場合はnilになる。
nums.index 9999  # => nil

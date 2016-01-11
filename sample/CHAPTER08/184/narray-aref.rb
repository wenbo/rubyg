require 'rubygems'
require 'narray'
na = NArray.int(2,3).indgen!  # => NArray.int(2,3): [[0, 1], [2, 3], [4, 5]]
a  = na.to_a                  # => [[0, 1], [2, 3], [4, 5]]
[ na[0,1], a[1][0] ]          # => [2, 2]
[ na[1,2], a[2][1] ]          # => [5, 5]
na = NArray.int(5,6,6).indgen!
a  = na.to_a
[ na[4,2,3], a[3][2][4] ]     # => [104, 104]
[ na[1,0,0], a[0][0][1] ]     # => [1, 1]
[ na[2,5,5], a[5][5][2] ]     # => [177, 177]

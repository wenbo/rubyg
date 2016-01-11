ary = [1,3,2,5,4] # nodisp
ary.inject(0) {|sum,x| sum + x }          # => 15
ary.inject {|sum,x| sum + x }             # => 15
ary.inject(:+)                            # => 15
ary.inject {|max,x| x > max ? x : max }   # => 5
ary.inject(1) {|product,x| product * x }  # => 120
ary.inject {|product,x| product * x }     # => 120
ary.inject(:*)                            # => 120

ary.inject {|sum,x| p [sum,x]; sum + x }  # => 15
# >> [1, 3]
# >> [4, 2]
# >> [6, 5]
# >> [11, 4]

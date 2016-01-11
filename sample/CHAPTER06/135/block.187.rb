# index 0 1 2 3 4
nums = [7,5,2,3,4]
nums.index {|n| n.even? }  # => 2
nums.index(&:even?)        # => 2
nums.rindex(&:even?)       # => 4

nums.find_index(&:even?)   # => 2
nums.find_index(5)         # => 1

("A".."Z").find_index "D"  # => 3

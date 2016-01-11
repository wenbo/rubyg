#index:0 1 2 3 4 5
ary = [1,2,3,4,5,6]
ary.values_at(1, 3 ,2)      # => [2, 4, 3]
ary.values_at(1..2, 4..5)   # => [2, 3, 5, 6]
ary.values_at(1, 3, 4..5)   # => [2, 4, 5, 6]

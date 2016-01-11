[1,2,3,4].take(2)            # => [1, 2]
[1,2,3,4].take(0)            # => []
[1,2,3,4].take(9)            # => [1, 2, 3, 4]
[1,2,3,4].take(-1) rescue $! # => #<ArgumentError: attempt to take negative size>
(10..20).take(2)             # => [10, 11]

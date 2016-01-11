[1,2,3,4].drop(1)            # => [2, 3, 4]
[1,2,3,4].drop(2)            # => [3, 4]
[1,2,3,4].drop(9)            # => []
[1,2,3,4].drop(-1) rescue $! # => #<ArgumentError: attempt to drop negative size>
(10..20).drop(3)             # => [13, 14, 15, 16, 17, 18, 19, 20]

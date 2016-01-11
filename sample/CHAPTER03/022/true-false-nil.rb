true && true                    # => true
[true && false,  true && nil]   # => [false, nil]
[false && true,  nil && true]   # => [false, nil]
[false && false, nil && nil ]   # => [false, nil]
[false && nil, nil && false ]   # => [false, nil]

true || true                    # => true
[true || false,  true || nil]   # => [true, true]
[false || true,  nil || true]   # => [true, true]
[false || false, nil || nil ]   # => [false, nil]
[false || nil, nil || false ]   # => [nil, false]

!true                           # => false
[!false, !nil]                  # => [true, true]

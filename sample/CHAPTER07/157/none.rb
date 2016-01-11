[1,2,3].none?{|x| x >= 2}   # => false
[2,3,4].none?{|x| x >= 5}   # => true
[false, false, false].none? # => true
[false, false, nil].none?   # => true
[true, false, nil].none?    # => false

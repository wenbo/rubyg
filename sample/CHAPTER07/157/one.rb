[1,2,3].one?{|x| x >= 4}   # => false
[2,3,4].one?{|x| x >= 4}   # => true
[2,3,4,5].one?{|x| x >= 4} # => false
[false, true, true].one?   # => false
[false, false, false].one? # => false
[false, true, nil].one?    # => true

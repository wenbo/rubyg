a = [1,2,"XX"]
a.map {|x| break unless Numeric === x; x*2  } # => nil
a.map {|x| next  unless Numeric === x; x*2 }  # => [2, 4, nil]

a.map {|x| break :invalid unless Numeric === x; x*2  } # => :invalid
a.map {|x| next  :invalid unless Numeric === x; x*2 }  # => [2, 4, :invalid]

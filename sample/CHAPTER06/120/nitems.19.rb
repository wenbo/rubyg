RUBY_VERSION  # => "1.9.1"
ary = [1,2,false,nil,3]
ary.length    # => 5
ary.nitems    # => 
# ~> -:4:in `<main>': undefined method `nitems' for [1, 2, false, nil, 3]:Array (NoMethodError)

def squares(*ints)
  ints.map{|x| x*x }
end
squares 1, 3, 9  # => [1, 9, 81]

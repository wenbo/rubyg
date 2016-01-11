# eachで書く
squares = []
[1,2,3].each {|x| squares << x*x }
squares                 # => [1, 4, 9]

# mapで書く
[1,2,3].map {|x| x*x }  # => [1, 4, 9]

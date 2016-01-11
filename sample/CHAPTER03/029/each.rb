[1,2,3].each do |x|
  p x
end
x rescue $! # => #<NameError: undefined local variable or method `x' for main:Object>
# >> 1
# >> 2
# >> 3

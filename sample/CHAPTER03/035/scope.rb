if true
  a = 1
end
# aは見える
a  # => 1
[2].each do |x|
  b = x
end
# bは見えない
b rescue $!
# => #<NameError: undefined local variable or method `b' for main:Object>

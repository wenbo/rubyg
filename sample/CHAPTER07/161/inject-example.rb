ary = [1,3,2,5,4]

sum = 0
ary.each {|x| sum = sum + x }
sum      # => 15

max = ary.first
ary.each {|x| max = x > max ? x : max }
max      # => 5

product = 1
ary.each {|x| product = product * x }
product  # => 120

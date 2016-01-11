a = 1, 2; a      # => [1, 2]
def btest1() yield 1, 2 end
btest1 {|x| x }  # => [1, 2] # !> multiple values for a block parameter (2 for 1)
def btest2() yield [1, 2] end
btest2 {|x| x }  # => [1, 2]

# each�ǽ�
evens = []
[1,2,3].each {|x| evens << x if x%2 == 0 }
evens                           # => [2]

# select�ǽ�
[1,2,3].select {|x| x%2 == 0 }  # => [2]

Foo = Struct.new :a, :b
foo = Foo.new
foo.a, foo.b = 1, 2
foo             # => #<struct Foo a=1, b=2>
[foo.a, foo.b]  # => [1, 2]
foo[0], foo[1] = 3, 4
foo             # => #<struct Foo a=3, b=4>
[foo.a, foo.b]  # => [3, 4]

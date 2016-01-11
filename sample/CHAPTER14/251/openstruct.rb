require 'ostruct'
o = OpenStruct.new :a => 1, :object_id => 3
o.a               # => 1
o.object_id       # => 68712290 (既存のメソッドはメンバにできない！)
o[:a] rescue $!   # => #<NoMethodError: undefined method `[]' for #<OpenStruct a=1, object_id=3>>
o.b = 2
o.abracadabra = 7
o.abracadsbra     # => nil  (打ち間違いでもエラーにならない！)
o                 # => #<OpenStruct a=1, object_id=3, b=2, abracadabra=7>

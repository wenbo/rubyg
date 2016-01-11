class X
  def initialize(a) @a = a end
  attr_accessor :a
  def succ()  X.new(@a+2) end
  def <=>(o)  @a <=> o.a end
  include Comparable
end
r = X.new(1) .. X.new(6)   # => #<X:0x8810404 @a=1>..#<X:0x88103f0 @a=6>
r.to_a   # => [#<X:0x8810404 @a=1>, #<X:0x88ea820 @a=3>, #<X:0x88ea80c @a=5>]

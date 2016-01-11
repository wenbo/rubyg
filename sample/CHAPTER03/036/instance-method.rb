class InstanceMethodExample
  def double(x)    x*2 end
  def quadruple(x) double(double(x)) end
  def show_self()  self end
end
obj = InstanceMethodExample.new # => #<InstanceMethodExample:0xb7b832e4>
obj.double(2)                   # => 4
obj.quadruple(2)                # => 8
obj.show_self                   # => #<InstanceMethodExample:0xb7b832e4>


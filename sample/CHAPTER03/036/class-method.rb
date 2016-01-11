class ClassMethodExample
  def self.double(x)    x*2 end
  def self.quadruple(x) double(double(x)) end
  def self.show_self()  self end
end
ClassMethodExample.double(2)       # => 4
ClassMethodExample.quadruple(2)    # => 8
ClassMethodExample.show_self       # => ClassMethodExample

class Super;  def self.meth1() "Super.meth1" end;  end
class Sub < Super
  def self.meth2()
    meth1       # => "Super.meth1"
    # Class#superclassを呼び出す
    superclass  # => Super
    # Module#attr_accessorを呼び出す
    attr_accessor :a
    "Sub.meth2"
  end
  meth1         # => "Super.meth1"
  meth2         # => "Sub.meth2"
  superclass    # => Super
  attr_accessor :b
end

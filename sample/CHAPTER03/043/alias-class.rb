MyString = String
MyString                 # => String
s = MyString.new "foo"   # => "foo"

class X; end
Y = X
Y       # => X
Y.new   # => #<X:0x83a1440>

module M; end
N = M   # => M

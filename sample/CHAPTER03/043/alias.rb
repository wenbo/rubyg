class Example
  def foo() :original end
  alias bar foo
end
obj = Example.new
obj.foo                         # => :original
obj.bar                         # => :original

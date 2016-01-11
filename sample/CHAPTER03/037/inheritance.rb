class Super
  def foo() :foo end
end
class Sub < Super
  def bar() :bar end
end
sub = Sub.new
sub.foo  # => :foo
sub.bar  # => :bar

class X
  def foo() :foo end
end
Y = X
class Y
  def bar() :bar end
end
Y.new.foo   # => :foo
X.new.bar   # => :bar

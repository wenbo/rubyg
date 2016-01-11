class X
  def X.foo() :foo end
  class << self
    alias bar foo
  end
end
X.bar  # => :foo

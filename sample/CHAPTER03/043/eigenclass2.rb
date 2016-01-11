class Module
  def alias_class_method(ali, orig)
    (class << self; self; end).instance_eval { alias_method ali, orig }
  end
end

class X
  def X.foo() :foo end
  alias_class_method :bar, :foo
end
X.bar   # => :foo

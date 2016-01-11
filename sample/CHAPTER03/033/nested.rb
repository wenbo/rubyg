class Foo
  def outer_method
    def inner_method # !> method redefined; discarding old inner_method
      :inner
    end
    :outer
  end
end
foo = Foo.new
# outer_method��Ƥ֤��Ȥ�inner_method���������롣
Foo.instance_methods(false)  # => [:outer_method]
foo.outer_method             # => :outer
Foo.instance_methods(false)  # => [:outer_method, :inner_method]
foo.inner_method             # => :inner
# ¾�Υ��󥹥��󥹤���inner_method��Ƥ֤��Ȥ��Ǥ��롣
foo2 = Foo.new
foo2.inner_method            # => :inner
# inner_method���������Ƥ���ΤǷٹ𤬽Ф롣
foo2.outer_method            # => :outer

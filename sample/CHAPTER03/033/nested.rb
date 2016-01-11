class Foo
  def outer_method
    def inner_method # !> method redefined; discarding old inner_method
      :inner
    end
    :outer
  end
end
foo = Foo.new
# outer_methodを呼ぶことでinner_methodが定義される。
Foo.instance_methods(false)  # => [:outer_method]
foo.outer_method             # => :outer
Foo.instance_methods(false)  # => [:outer_method, :inner_method]
foo.inner_method             # => :inner
# 他のインスタンスからinner_methodを呼ぶことができる。
foo2 = Foo.new
foo2.inner_method            # => :inner
# inner_methodを再定義しているので警告が出る。
foo2.outer_method            # => :outer

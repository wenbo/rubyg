class Object
# メソッドが存在しないときに呼ばれるメソッドを定義する。Objectクラスなのですべてのオブジェクトが対象。この例では「XXXX?」形式のメソッドを「is_XXXX?」、「is_a_XXXX?」、「is_an_XXXX?」とも呼べるようにする。
  def method_missing(name, *args, &block)
# メソッド名がis_、is_a、is_anで始まる場合は、それらを取り除いたメソッドを呼ぶ。
    if name.to_s =~ /^is_(an?_)?(.+)$/
      __send__ $2, *args, &block
    else
# スーパークラスのmethod_missingを呼ぶ。ObjectはKernelをインクルードしているので、Kernel#method_missingが呼ばれる。
      super
    end
  end
end
1.tainted?                  # => false
1.is_tainted?               # => false
1.kind_of? Fixnum           # => true
1.is_a_kind_of? Fixnum      # => true
1.instance_of? Fixnum       # => true
1.is_an_instance_of? Fixnum # => true
# 存在しないメソッドなのでNoMethodError。
1.no_method rescue $!       # => #<NoMethodError: undefined method `no_method' for 1:Fixnum>

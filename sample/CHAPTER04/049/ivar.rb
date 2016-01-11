class B
  def initialize(a,b,c) @a, @b, @c = a, b, c end
  def ==(x)     # インスタンス変数がすべて等しい場合に成立させる
    instance_variables.all? do |v|
      instance_variable_get(v) == x.instance_variable_get(v)
    end
  end
end
b1 = B.new(1,2,3)  # => #<B:0x886470c @a=1, @b=2, @c=3>
b2 = B.new(1,2,3)  # => #<B:0x88b0378 @a=1, @b=2, @c=3>
b1 == b2           # => true

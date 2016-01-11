class A
  def initialize(v) @v = v end
  attr_reader :v
end
x1 = A.new 1
x2 = A.new 1
# そのままだと同一でないと「==」にならない
x1 == x1  # => true
x1 == x2  # => false
# ==を再定義する
class A
  # クラスとインスタンス変数が等しいのが同値の条件
  def ==(x) x.instance_of?(A) and @v == x.v end
end
x1 == x2  # => true

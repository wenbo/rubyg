# Enumerable#each_with_indexもどきの比較
class Array
  def my_each_with_index(&block)            # each_with_indexの同等品
    length.times {|i| yield self[i], i }
  end
  def instance_eval_each_with_index(&block) # selfを変えるeach_with_index
    length.times {|i| instance_exec(self[i], i, &block) }
  end
end
a = [:foo, :bar]
# selfはすりかわらない。
a.my_each_with_index do |x,i|
  self    # => main, main
  [x, i]  # => [:foo, 0], [:bar, 1]
end
# selfはaにすりかわる。
a.instance_eval_each_with_index do |x,i|
  self    # => [:foo, :bar], [:foo, :bar]
  length  # => 2, 2
  [x, i]  # => [:foo, 0], [:bar, 1]
end

# メソッド定義の例
Object.instance_exec(1) do |x|
  x       # => 1
# Objectの特異メソッド（クラスメソッド）を定義する。
  def cmeth() :class_method end
  self    # => Object
end
Object.module_exec(1) do |x|
  x       # => 1
# Objectのインスタンスメソッドを定義する。
  def imeth() :instance_method end
  self    # => Object
end
Object.cmeth       # => :class_method
Object.new.imeth   # => :instance_method

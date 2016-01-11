class Baz
  # attr_accessorはModuleクラスのメソッドなので呼び出せる
  attr_accessor :attrib
  # 任意の式が書ける
  1+2                           # => 3
  def self.a_class_method() :class_method end
  # クラスメソッド定義直後に呼び出せる
  a_class_method                # => :class_method
end

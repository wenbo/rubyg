module M
  def a_module_method() :module_method end
  def self.included(mod)        # includeされたときに評価される
    mod                # => C
    mod.extend ClassMethod      # include時にクラスメソッドを追加する
  end
  module ClassMethod
    def a_class_method() :class_method end
  end
end
class C
  include M
end
C.new.a_module_method  # => :module_method
C.a_class_method       # => :class_method

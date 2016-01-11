require 'erb'
require 'erubis'
class ErubyMethodTest
  template = 'Hello <%=name %>!'
  ERB_OBJ = ERB.new template
  ERUBIS_OBJ = Erubis::Eruby.new template

# ERBでコンパイルされたeRubyスクリプトでErubyMethodTest#erb_methodを定義する。
  ERB_OBJ.def_method self, 'erb_method(name)'
# ErubisでコンパイルされたeRubyスクリプトでErubyMethodTest#erubis_methodを定義する。
  ERUBIS_OBJ.def_method self, 'erubis_method(name)'

# 特異クラスを開けば、クラスメソッドも定義できる。
  class << self
    ERB_OBJ.def_method self, 'erb_class_method(name)'
    ERUBIS_OBJ.def_method self, 'erubis_class_method(name)'
  end
end

obj = ErubyMethodTest.new
# 通常のインスタンスメソッドとして呼び出すことができる。
obj.erb_method "rubikitch"  # => "Hello rubikitch!"
obj.erubis_method "all"     # => "Hello all!"
# 通常のクラスメソッドとして呼び出すことができる。
ErubyMethodTest.erb_class_method "eigenclass"    # => "Hello eigenclass!"
ErubyMethodTest.erubis_class_method "metaclass"  # => "Hello metaclass!"

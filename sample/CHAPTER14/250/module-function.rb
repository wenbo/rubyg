module Foo
  def double(x)    x*2 end
# doubleのみをモジュール関数にする。
  module_function :double
# モジュール関数のエイリアスを作成するには、aliasの後にmodule_functionが必要。
  alias :twice :double
  module_function :twice
# Fooモジュールの以下のメソッドすべてをモジュール関数にする。
  module_function
  def triple(x)    x*3 end
  def quadruple(x) x*4 end
end
class Bar
# モジュール関数はモジュールをincludeして関数的メソッドとして使える。
  include Foo
  def eight_times(x) double(quadruple(x)) end
end
# モジュールの特異メソッドとしても使える。
Foo.double(3)           # => 6
Bar.new.eight_times(8)  # => 64

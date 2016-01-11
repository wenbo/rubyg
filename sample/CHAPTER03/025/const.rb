CONST = "toplevel" # トップレベル（Objectクラス）の定数定義は最後に参照される。
class SuperClass
  CONST = "superclass"          # トップレベルクラスでの定数定義。
end
class AClass
  # ネストの外側がないのでスーパークラス（Object）の定数が参照される。
  CONST                         # => "toplevel"
end
class SubClass < SuperClass
  # ネストの外側がないのでスーパークラス（SuperClass）の定数が参照される。
  CONST                         # => "superclass"
end
module Nest
  CONST = "nest"                # ネストの内側の定数定義
  class SubSubClass < SubClass
    # まずネストの外側が優先的に参照される
    CONST                       # => "nest"
  end
  # ネストの外側がないのでスーパークラスの定数が参照される
  SubSubClass::CONST            # => "superclass"
  # ::から定数を始めるとトップレベルの定数が参照される
  ::CONST                       # => "toplevel"
end
# スーパークラスの定数が参照される
Nest::SubSubClass::CONST        # => "superclass"
SubClass::CONST                 # => "superclass"

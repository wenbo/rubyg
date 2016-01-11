module Nest
  @@cv = "nest"       # Nestのクラス変数はネストの内側でも見えない
  class SuperClass
    @@cv = "super"    # SuperClassのクラス変数はSubClassとも共有される
  end
  class SubClass < SuperClass
    @@cv              # => "super"
    @@cv = "sub"      # サブクラスで書き換え
  end
  class SuperClass
    # 共有されているのでスーパークラスに影響が及ぶ
    @@cv              # => "sub"
  end
end

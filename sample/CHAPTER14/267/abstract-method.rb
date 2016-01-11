class Module
  # 引数で指定された抽象メソッドを定義するメソッド。
# arg_descは引数や返り値についての情報が書けるが、型チェックまではしない。
  def abstract_method(meth, arg_desc="")
# Module#define_methodでselfが変わるので変数に保存しておく必要がある。
    mod = self
# メソッド内でメソッドを定義する。メソッドの引数は任意個。
    define_method(meth) do |*|
# 例外を発生させる。ここでのselfはクラスのインスタンスなのでselfとは書けない。
      raise NotImplementedError, "#{mod}##{meth}#{arg_desc} must be redefined in subclass."
    end
  end
end

# 抽象クラスの例
# スーパークラスに抽象メソッドhogeを宣言する。インスタンスはサブクラスから作られるという意思表示にもなる。
class Base
  abstract_method :hoge, "(integer) -> integer"
end
# サブクラスでhogeメソッドを実装する。
class Concrete < Base
  def hoge(x) x*2 end
end
# 抽象メソッドなのでNotImplementedError例外が発生する。
begin Base.new.hoge(3)
rescue NotImplementedError
  $! # => #<NotImplementedError: Base#hoge(integer) -> integer must be redefined in subclass.>
end
# サブクラスからは呼び出し可能。
Concrete.new.hoge(3)            # => 6

# インターフェースの例
# モジュールで抽象メソッドを宣言すると、Javaのinterfaceみたいな感じになる。
module Interface
  abstract_method :foo, "(string) -> integer"
  abstract_method :bar, "() -> symbol"
end
class Implementation
# fooとbarが抽象メソッドになる。
  include Interface
  def bar() :implemented  end
end

# このようにして実装不足が発見できる。
begin Implementation.new.foo
rescue NotImplementedError
  $! # => #<NotImplementedError: Interface#foo(string) -> integer must be redefined in subclass.>
end
Implementation.new.bar          # => :implemented

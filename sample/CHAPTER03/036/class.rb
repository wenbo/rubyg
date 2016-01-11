class Foo       # 定義は空
end
# Fooクラスは定数Fooに代入されている
Foo             # => Foo
defined? Foo    # => "constant"
# Fooはクラスオブジェクト
Foo.class       # => Class
# スーパークラスはObject
Foo.superclass  # => Object

class Bar < Foo # Fooを継承する
end
Bar.superclass  # => Foo

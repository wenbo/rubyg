class Foo
  def initialize(a, b)
    @a, @b  = a, b
    @v = a + b                  # 外から見えないインスタンス変数
  end
# @a、@b、@cに対するアクセサを作成する。
  attr_reader   :a              # 読み込み専用
  attr_writer   :b              # 書き込み専用
  attr_accessor :c              # 読み書き可能
# 「attr_accessor :d」と等価。
  def d()    @d      end        # 「attr_reader :d」と等価
  def d=(d)  @d = d  end        # 「attr_writer :d」と等価
end

foo = Foo.new(1,2)  # => #<Foo:0xb7b30fbc @b=2, @a=1, @v=3>
# @aの読み込みは可能だが、書き込みができない。
foo.a               # => 1
(foo.a = 9) rescue $!
# => #<NoMethodError: undefined method `a=' for #<Foo:0xb7b30fbc @b=2, @a=1, @v=3>>
# @bの書き込みは可能だが、読み込みはできない。
foo.b rescue $!
# => #<NoMethodError: undefined method `b' for #<Foo:0xb7b30fbc @b=2, @a=1, @v=3>>
foo.b = 6
foo                 # => #<Foo:0xb7b30fbc @b=6, @a=1, @v=3>
# @cは読み書き可能。
foo.c = 5
foo.c               # => 5
# 字面上代入なので自己代入ができる。
foo.c += 1
foo.c               # => 6
# 字面上代入なので多重代入もできる。
foo.c, v = 7, 8
v                   # => 8
foo                 # => #<Foo:0xb7b30fbc @b=6, @a=1, @v=3, @c=7>

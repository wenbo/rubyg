class Foo
  def initialize(var)  @var = var end
# インスタンス変数@varは外部からは参照しか許していない。
  attr_reader :var
end
# 通常のコンストラクタでオブジェクトを作成。
Foo.new(3)           # => #<Foo:0xb7b9c794 @var=3>
# オブジェクトの領域を確保しただけ。
foo0 = Foo.allocate  # => #<Foo:0xb7b9c460>
# 領域を確保しただけでは使いものにならないので外部から強引にインスタンス変数を設定する。
foo0.instance_variable_set(:@var, 7)
foo0                 # => #<Foo:0xb7b9c460 @var=7>

require 'rubygems'
require 'active_support'

class Super
  @@a = 1
  @@b = 2
  cattr_reader :a    # @@aへの読み込みアクセサ
  cattr_writer :a    # @@aへの書き込みアクセサ
  cattr_accessor :b  # @@bへの読み書きアクセサ
end
class Sub < Super; end

# クラスメソッドが定義される。
Sub.a                # => 1
Sub.a = 10; Sub.a    # => 10
# サブクラスで書き換えるとスーパークラスに影響が出る。
Sub.b                # => 2
Sub.b = 20; Super.b  # => 20
sup = Super.new
sub = Sub.new
# インスタンスメソッドも定義される。
sub.a                # => 10
sub.a = 100; sub.a   # => 100
# サブクラスで書き換えるとスーパークラスに影響が出る。（同じふきだしで）
sub.b                # => 20
sub.b = 200; sup.b   # => 200

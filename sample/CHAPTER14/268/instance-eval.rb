class A
  def initialize(x)  @x = x end
  private
  def private_meth() @x * 2 end
end
class B
  def initialize(a)  @a, @v = a, 3  end
  def test          # 文脈を変える実験
    self            # => #<B:0xb7d5dce0 @v=3, @a=#<A:0xb7d5df9c @x=5>>
    a = @a          # => #<A:0xb7d5df9c @x=5>
# instance_eval内に今のselfの情報を持ち込むには予めローカル変数に代入する。
    v = @v
# ここだけ a の文脈になる。
    a.instance_eval do
      # selfがaにすり変わった。この時点で外側のselfは見えない。
      self          # => #<A:0xb7d5df9c @x=5>
      # aのインスタンス変数@xにアクセスする。
      @x            # => 5
      # instance_eval内ではプライベートメソッドも呼べる。
      private_meth  # => 10
      # 外側のselfのインスタンス変数を持ち込んだ。
      v             # => 3
      # instance_eval内でのメソッド定義は特異メソッドとなる。
      def smeth() :singleton_method end
    end
    self            # => #<B:0xb7d5dce0 @v=3, @a=#<A:0xb7d5df9c @x=5>>
# smethはaの特異メソッドになっている。
    a.smeth         # => :singleton_method
    a2 = A.new 8    # => #<A:0xb7d5c304 @x=8>
    a2.smeth rescue $!
    # => #<NoMethodError: undefined method `smeth' for #<A:0xb7d5c304 @x=8>>
# instance_evalはブロックの代わりに文字列を指定できる。
    a.instance_eval "private_meth" # => 10
# ここだけクラスAの文脈になる。
    A.module_eval do
      self                # => A
      # module_eval内でのメソッド定義はインスタンスメソッドとなる。
      def imeth() :instance_method end
    end
# インスタンスメソッドなのでAオブジェクトならば呼べる。
    a.imeth               # => :instance_method
    a2.imeth              # => :instance_method

# ここだけクラスオブジェクトAの文脈になる。
    A.instance_eval do
      # selfはクラスオブジェクトAになる。
      self                # => A
      
      def cmeth() :class_method end   # クラスメソッド定義
    end
    A.respond_to? :cmeth  # => true
    A.cmeth               # => :class_method
  end
end
a = A.new 5  # => #<A:0xb7d5df9c @x=5>
b = B.new a  # => #<B:0xb7d5dce0 @v=3, @a=#<A:0xb7d5df9c @x=5>>
b.test

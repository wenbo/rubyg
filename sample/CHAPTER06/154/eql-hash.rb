# Integer、String、Hash、Array、Struct等の組み込みクラスにおいてキーと同値なオブジェクトを指定すると、対応する値を取り出すことができる。
{1 => :ok}[1]                      # => :ok
{"a_string" => :ok}["a_string"]    # => :ok
{{:a=>1} => :ok}[:a => 1]          # => :ok
{[1] => :ok}[[1]]                  # => :ok
S = Struct.new :a
{S.new(1) => :ok}[S.new(1)]        # => :ok

class A
  def initialize(a, b) @a, @b = a, b end
  attr_reader :a, :b
end
# 同値なユーザ定義オブジェクトをふたつ作成する。
a1 = A.new 1, 2
a2 = A.new 1, 2
# ユーザ定義オブジェクトの場合は、同一でないと対応する値を取り出せない。
{a1 => :ok}[a1]                    # => :ok
{a1 => :ok}[a2]                    # => nil

# この問題に対応するには、A#eql?とA#hashを定義する。
class A
# xがAクラスで、インスタンス変数がeql?である場合ならば真と定義する。
  def eql?(x) x.instance_of?(A) and @a.eql?(x.a) and @b.eql?(x.b) end
# インスタンス変数@aと@bのハッシュ値の排他的論理和と定義する。
  def hash()  @a.hash ^ @b.hash                                   end
end
# 無事に取り出すことができた。
{a1 => :ok}[a2]                    # => :ok

# @bの値を無視する場合は、このようにする。
class A
  def eql?(x) x.instance_of?(A) and @a.eql?(x.a) end
  def hash()  @a.hash                            end
end
{A.new(1,2) => :ok}[A.new(1, 10)]  # => :ok

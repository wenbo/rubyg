# インスタンス変数を含むモジュールを作成する。
module M
  def mult(x) @v * x end
end
# 無名クラスを作成する。
klass = Class.new do
# Mをインクルードする。
  include M
# インスタンス変数@vにアクセス可能にする。
  attr_accessor :v
end
obj = klass.new  # => #<#<Class:0x97abeb8>:0x97abdc8>
obj.v = 7
obj.mult(10)     # => 70

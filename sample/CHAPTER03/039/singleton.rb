str = "singleton"
str.upcase             # => "SINGLETON"
class << str
  # 特異メソッドを新たに定義する
  def smeth()  "Other strings don't have this method." end
  # 特異メソッドでオリジナルのメソッドを再定義する
  def upcase() super + "!!"                            end
end
# 特異メソッドのリストを得る
str.singleton_methods  # => [:smeth, :upcase]
# strだけのメソッド
str.smeth              # => "Other strings don't have this method."
# 挙動が変わった！
str.upcase             # => "SINGLETON!!"
# たとえ同じ内容の文字列でも、別のオブジェクトなので特異メソッドは使えない
str2 = "singleton"
str2.equal? str        # => false
str2.upcase            # => "SINGLETON"
str2.smeth rescue $!
# => #<NoMethodError: undefined method `smeth' for "singleton":String>
# 破壊的メソッドで内容を書き換えても特異メソッドは有効
str.replace "altered"
str.upcase             # => "ALTERED!!"

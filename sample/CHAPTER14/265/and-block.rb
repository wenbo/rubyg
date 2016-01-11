# 「Enumerable#map」で変換した結果を「Array#join」でつなげる「Enumerable#mapconcat」を定義する例
module Enumerable
# ブロックをmapに丸投げする。
  def mapconcat(separator, &block)  map(&block).join separator  end
# mapconcatと等価。
  def mapconcat_yield(separator)  map{|x| yield x }.join separator  end
end
[1,2,3].mapconcat(",") {|x| x*x }        # => "1,4,9"
[1,2,3].mapconcat_yield(",") {|x| x*x }  # => "1,4,9"

# コンストラクタにブロックをつける例
class X
# 間違った例。yieldが呼び出し元の文脈で評価されるため、正しく動作しない。
  def self.define_wrong()       obj = new; obj.instance_eval { yield }; obj end
# Object#instance_evalにブロックを丸投げするのが正解。
  def self.define_right(&block) obj = new; obj.instance_eval(&block); obj   end
  attr_accessor :v
end
wrong = X.define_wrong {
# Xのインスタンスの文脈で評価させるつもりが、呼び出し側の文脈で評価されている。
  self                      # => main
  (self.v = :ok) rescue $!  # => #<NoMethodError: undefined method `v=' for main:Object>
}
wrong                       # => #<X:0x9bced9c>
right = X.define_right {
# Xのインスタンスの文脈で評価されている。
  self                      # => #<X:0x9bce6bc>
  self.v = :ok
}
right                       # => #<X:0x9bce6bc @v=:ok>

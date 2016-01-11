a = ["a"]
def a.hoge() "singleton method!" end   # aの特異メソッドhogeを定義してみる。
# クローン生成。
b = a.clone             # => ["a"]
# クローンは同値ではあるが同一ではない。
a == b                  # => true
a.equal? b              # => false
# クローンは特異メソッドもコピーされる。dupはコピーされない。
b.hoge                  # => "singleton method!"
a.dup.hoge rescue $!
# => #<NoMethodError: undefined method `hoge' for ["a"]:Array>
# aの要素もbの要素も同じ"a"を指している（浅いコピー）。
a[0].equal? b[0]        # => true
# 要素に破壊的メソッドを適用すると両方とも書き変わってしまうので注意。
a[0].upcase!
[ a[0], b[0] ]          # => ["A", "A"]

# 深いコピーを生成するメソッドを定義する。
class Object
  def deep_clone() Marshal.load(Marshal.dump(self))  end
end
a = ["a"]
# 深いコピーは要素もコピーされる。
c = a.deep_clone        # => ["a"]
a[0].equal? c[0]        # => false
# 破壊的メソッドを適用しても深いコピーは影響されない。
a[0].upcase!
[ a[0], c[0] ]          # => ["A", "a"]

# 配列のやや深いコピーはmapを使うといいが、多次元配列の要素まではコピーされない。
class Array
  def map_clone() map{|x| x.clone }  end
end
# Marshalではコピーできなかったものがmapだとできる。
a = ["a", ["b"], Proc.new{}, $stdout]
# => ["a", ["b"], #<Proc:0x895fd14@-:32>, #<IO:<STDOUT>>]
def a.hoge() "singleton method!" end
c = a.map_clone
# => ["a", ["b"], #<Proc:0x895e798@-:32>, #<IO:<STDOUT>>]
# 配列の要素はコピーされている。
a[0].equal? c[0]        # => false
# "b"は同じものを指しているので破壊的メソッドを適用したら両方変更される。
a[1][0].equal? c[1][0]  # => true

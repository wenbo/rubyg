class Adder
# 引数は数値の配列で指定するコンストラクタ。
  def initialize(numbers) @nums = numbers.map{|s| s.to_f } end
  def sum()               @nums.inject{|s,x| s + x } end
# スペースで区切られた数値を読取ってAdderを作成する。
  def self.parse(string)  new string.split end
# IO（実際はreadメソッドを受け付けるオブジェクト）からAdderを作成する。
  def self.for_io(io)     parse(io.read) end
# ファイル名で指定されたファイルからAdderを作成する。
  def self.load(filename) open(filename){|io| for_io io } end
end
# 通常のコンストラクタを使用した場合。
a1 = Adder.new([1,2,3])
[ a1, a1.sum ]  # => [#<Adder:0x819be0c @nums=[1.0, 2.0, 3.0]>, 6.0]
# 文字列を解析した場合。
a2 = Adder.parse("1.1 2.2 3.3")
[ a2, a2.sum ]  # => [#<Adder:0x826e6cc @nums=[1.1, 2.2, 3.3]>, 6.6]
# ファイルを解析した場合。
a3 = Adder.load("nums.dat")
[ a3, a3.sum ]  # => [#<Adder:0x826e348 @nums=[2.0, 3.0, 4.0]>, 9.0]

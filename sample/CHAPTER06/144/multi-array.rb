# 0で初期化された2x2の疑似二次元配列。
Array.new(2){ Array.new(2,0) }       # => [[0, 0], [0, 0]]
# 文字列"string"で初期化された2x2の疑似二次元配列。文字列には破壊的メソッドがあるのでブロックで初期値を設定している。
Array.new(2){ Array.new(2){"str"} }  # => [["str", "str"], ["str", "str"]]
# 4x3の疑似二次元配列を配列式で作成する。疑似多次元配列はネストした配列に過ぎない。
table = [[ 1, 2, 3],
         [ 4, 5, 6],
         [ 7, 8, 9],
         [10,11,12]]
# 0行0列（左上）の要素。
table[0][0]              # => 1
# 1行1列の要素。
table[1][1]              # => 5
# 3行2列（右下）の要素。
table[3][2]              # => 12
# 疑似多次元配列の弱点がこれ。0行999列の要素も999行0列の要素も存在しないが、例外発生するのが後者のみ。要注意！
table[0][999]            # => nil
table[999][0] rescue $!  # => #<NoMethodError: undefined method `[]' for nil:NilClass>
# ネストを取り除く（平滑化）。
table.flatten            # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
# 要素を1つずつ処理するには二重ループを使用する。「each_with_index」ならばi行j列とインデックスにアクセスできる。ここでは二重ループの中で新たな配列「elements」に「table」の要素を追加している。
elements = []
table.each_with_index do |line, i|
  line.each_with_index {|element, j| elements << element}
end
elements          # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
# 縦横の合計を計算するので「Array#sum」を定義する。
class Array; def sum() inject{|s,x| s+x } end; end
# それぞれの行の合計
line_sums   = table.map{|line| line.sum }          # => [6, 15, 24, 33]
# それぞれの列の合計を計算するにはArray#transposeで転置してから行の合計を求める。
column_sums = table.transpose.map{|col| col.sum }  # => [22, 26, 30]
# 縦横計算をするわけではなく、離散データを扱うには配列をキーにしたハッシュを使う。
hash = { [0,0]=>1 }
hash[[3,2]] = 12
hash         # => {[0, 0]=>1, [3, 2]=>12}
hash[[3,2]]  # => 12

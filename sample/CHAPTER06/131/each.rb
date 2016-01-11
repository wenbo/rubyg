ary = ["one", "two", "three"]
# 各要素についてブロックを評価する。
ary.each do |s|
  "{#{s}}"                      # => "{one}", "{two}", "{three}"
end
# 逆順に繰り返すには「Array#reverse_each」を使う。
ary.reverse_each do |s|
  "(#{s})"                      # => "(three)", "(two)", "(one)"
end
# 制御構造のforは内部で「Array#each」を呼んでいる。
for s in ary
  "<#{s}>"                      # => "<one>", "<two>", "<three>"
end
# for式のループ変数はスコープを作らないので注意。
s                               # => "three"
# ネストした配列は複数のブロックパラメータで受ける。
nested1 = [[1, "one"], [2, "two"], [3, "three"]]
nested1.each do |int, english|
  "#{int} = #{english}"         # => "1 = one", "2 = two", "3 = three"
end
# ブロックパラメータは多重代入に似たルールで受けるので、複雑にネストした配列も簡単に扱える。
nested2 = [[1, [1.0, "one"]], [2, [2.0, "two"]], [3, [3.0, "three"]]]
nested2.each do |int, (float, english)|
  "#{int}/#{float}/#{english}"  # => "1/1.0/one", "2/2.0/two", "3/3.0/three"
end

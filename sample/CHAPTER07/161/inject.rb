# 合計を計算する「Enumerable#sum」はあってもいいと思うので自分で定義しておく。「inject {|s,x| s+x }」はかつての合計のイディオム。
module Enumerable
  def sum
    self.inject{|sum,element| sum + element }
  end
end

# 配列の要素の合計を求める。
[1,2,3,4,5].sum    # => 15
# 文字列の加算も定義されているのでいちおう文字列にも適用できるが、通常は「Array#join」を使う
%w[a b c d e].sum  # => "abcde"
# 範囲中の数値の合計を求める。
(1..10).sum        # => 55

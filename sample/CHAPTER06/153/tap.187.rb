ary = [8, 17, 9, 32]
# 値がキーの二乗なハッシュを作成する例
# 一番素直な方法。aryのそれぞれの要素においてhashに値を設定する。
hash={}; ary.each{|x| hash[x] = x*x }; hash  # => {17=>289, 8=>64, 9=>81, 32=>1024}
# 空ハッシュを初期値にして、順次hに値を設定する方法。((:Enumerable#inject:))はブロックの値を使うのでブロックの返り値にhを設定する。
ary.inject({}) {|h,x| h[x] = x*x; h }        # => {17=>289, 8=>64, 9=>81, 32=>1024}
# Hash[key, value, key, value, ...]でハッシュが作成する方法。((:Enumerable#map:))でキーと値のペアの配列を作成し、((:Array#flatten:))で平滑化する。
Hash[*ary.map{|x| [x, x*x]}.flatten]         # => {17=>289, 8=>64, 9=>81, 32=>1024}
# これがここで取り上げるObject#tapによる方法。素直な方法とあまり変わらないながらも、わざわざ「; hash」を書かなくて済むのが美しい。
{}.tap {|h| ary.each{|x| h[x] = x*x }}       # => {17=>289, 8=>64, 9=>81, 32=>1024}
# ensure節の結果は捨てられるため、Object#tapと同様の効果がある。
begin   hash2 = {}
ensure  ary.each{|x| hash2[x] = x*x }
end
hash2     # => {17=>289, 8=>64, 9=>81, 32=>1024}
# 偶数の二乗を求める例
# aryのうち偶数のみを抜き出し、その二乗を求める簡潔な方法。
ary.select(&:even?).map{|x| x*x } # => [64, 1024]
# Array#eachの中で条件式を使って値を加える方法。この方法ならば複雑な条件分岐にも対応できる。
[].tap {|a| ary.each {|x| a << x*x if x.even? }} # => [64, 1024]
# 破壊的メソッド適用後に自分自身を返すことを保証する例
# 多くの「!」付き破壊的メソッドは結果が変わらない場合にnilを返すので、tapで必ずselfを返すようにする。
"water".downcase!                # => nil
"water".tap {|s| s.downcase! }   # => "water"
"water".tap {|s| s.upcase! }     # => "WATER"

# ここの4行のうち「.tap {〜}」の色付け（あるいは強調・下線などの装飾）をお願いします。
# 途中経過を表示する例
ary.map{|x| x+1 }.select(&:odd?)                                    # => [9, 33]
# Enumerable#mapの途中経過を覗き見し、表示する。
ary.map{|x| x+1 }.tap {|a| printf("map: %p\n", a) }.select(&:odd?)  # => [9, 33]
ary.select {|x| x>10 && x.even? }                        # => [32]
# aryの要素とEnumerable#selectの条件式を覗き見し、表示する。
ary.select {|x| (x>10 && x.even?).tap {|b| p [x, b] } }  # => [32]
# >> map: [9, 18, 10, 33]
# >> [8, false]
# >> [17, false]
# >> [9, false]
# >> [32, true]

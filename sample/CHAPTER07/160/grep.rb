# 完全一致
# onlyのみを取り出す。
%w[only clearly fast].grep("only")                      # => ["only"]

# 正規表現マッチ
# lyを含む文字列を取り出す。
%w[only clearly fast].grep(/ly/)                      # => ["only", "clearly"]
# ブロックをつけると評価結果を集めた配列が返る。下の式と等価になる。
%w[only clearly fast].grep(/ly/) {|s| s.upcase }      # => ["ONLY", "CLEARLY"]
%w[only clearly fast].grep(/ly/).map {|s| s.upcase }  # => ["ONLY", "CLEARLY"]
# マッチする要素が存在しない場合は空配列が返る。
%w[only clearly fast].grep(/hoge/)                    # => []
%w[only clearly fast].grep(/hoge/) {|s| s.upcase }    # => []
# 配列のメソッドのうち、「to_X」形式のものを取り出す。
# Ruby 1.8だと文字列配列、Ruby 1.9だとシンボル配列になる。
Array.instance_methods.grep(/^to_.$/) # => [:to_s, :to_a]

# クラス名・モジュール名でマッチ
# 数値のみを抜き出す。
["1.1", 3.14, 2, 99999999999999].grep(Numeric)  # => [3.14, 2, 99999999999999]
# 文字列のみを抜き出す。
["1.1", 3.14, 2, 99999999999999].grep(String)   # => ["1.1"]

# 範囲オブジェクトでマッチ
# 範囲内の数のみを抜き出す。
[0, 1, 1.1, 2, 3].grep(1..2)    # => [1, 1.1, 2]

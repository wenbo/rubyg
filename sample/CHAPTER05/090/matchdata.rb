#     0         1         2  
# idx:0123456789012345678901234
md = "<<<Item: Apple, Orange>>>".match(/Item: (\w+), (\w+)/)
# 正規表現マッチの情報を格納しているMatchDataを得る。
md                    # => #<MatchData "Item: Apple, Orange" 1:"Apple" 2:"Orange">
Regexp.last_match     # => #<MatchData "Item: Apple, Orange" 1:"Apple" 2:"Orange">
$~                    # => #<MatchData "Item: Apple, Orange" 1:"Apple" 2:"Orange">
# 正規表現にマッチした文字列のオフセット（始点と終点のインデックス）を得る。
md.offset(0)                    # => [3, 22]
# 正規表現にマッチした文字列のオフセットを別々に得る。
[ md.begin(0), md.end(0) ]      # => [3, 22]
# ()にマッチした文字列のオフセットを得る。
[ md.offset(1), md.offset(2) ]  # => [[9, 14], [16, 22]]
# ()にマッチした文字列のオフセットを別々に得る。
[ md.begin(1), md.end(1) ]      # => [9, 14]
# 正規表現にマッチした文字列を得る。
[ md[0], $& ]                   # => ["Item: Apple, Orange", "Item: Apple, Orange"]
# ()にマッチした文字列を得る。
[ md[1], md[2], $1, $2 ]        # => ["Apple", "Orange", "Apple", "Orange"]
Regexp.last_match(1)            # => "Apple"
# 最後の()にマッチした文字列を得る。
[ md[-1], $+ ]                  # => ["Orange", "Orange"]
# 正規表現にマッチした部分より前の文字列を得る。
[ md.pre_match, $` ]            # => ["<<<", "<<<"]
# 正規表現にマッチした部分より後ろの文字列を得る。
[ md.post_match, $' ]           # => [">>>", ">>>"]
# ()にマッチした文字列（キャプチャ）の配列を得る。
md.captures                     # => ["Apple", "Orange"]
# 配列化する。
md.to_a                         # => ["Item: Apple, Orange", "Apple", "Orange"]
# 「()の数+1」を返す。
md.size                         # => 3
# 新たな正規表現マッチに伴い、特殊変数の値が変更される。
md.captures.select {|e| e =~ /A/ } # => ["Apple"]
$1                                 # => nil

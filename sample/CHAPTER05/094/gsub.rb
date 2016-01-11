# 最初の「small」のみを「big」に置換する。
"small cat, small dog".sub(/small/, 'big')    # => "big cat, small dog"
# 全ての「small」を「big」に置換する。
"small cat, small dog".gsub(/small/, 'big')   # => "big cat, big dog"
# 「\&」、「$&」はマッチする部分。
'small big'.gsub(/[a-z]+/, '{\&}')            # => "{small} {big}"
'small big'.gsub(/[a-z]+/) { $&.capitalize }  # => "Small Big"
# 文字列 '+' をパターンにすると、 '+' が置き換え対象になる。
'3+2'.sub(/\+/, '-')                          # => "3-2"
'3+2'.sub('+', '-')                           # => "3-2"
# HTMLのB要素をEM要素に置換する例
html = '<b>Big</b>, <b>Huge</b>'
# 置換文字列内では、最初の括弧にマッチする部分を「\1」で指定する。
html.gsub(%r!<b>(.+?)</b>!, '<em>\1</em>')    # => "<em>Big</em>, <em>Huge</em>"
html.gsub(%r!<b>([^>]+)</b>!, '<em>\1</em>')  # => "<em>Big</em>, <em>Huge</em>"
# マッチした部分をブロック評価結果で置き換える。
html.gsub(%r!<b>(.+?)</b>!) {"<em>#$1</em>"}  # => "<em>Big</em>, <em>Huge</em>"

#!/usr/local/bin/ruby -Ke
str = "1byte-char"
# バイト単位で反転する。
str.reverse                  # => "rahc-etyb1"
# バイト単位で破壊的に反転する。
str.reverse!                 # => "rahc-etyb1"
str                          # => "rahc-etyb1"
euc = "マルチバイト"
# 日本語文字列をバイト単位で反転するとめちゃくちゃな結果になる。
euc.reverse                 # めちゃくちゃな結果になる
# 1文字ごとの文字列配列を作成し、それをを反転して結合する。
euc.split(//).reverse.join   # => "トイバチルマ"
euc.scan(/./).reverse.join   # => "トイバチルマ"
# Ruby 1.8.7以降で使える圧倒的に高速な方法。
euc.chars.to_a.reverse.join  # => "トイバチルマ"

#!/usr/local/bin/ruby -Ke
euc1 = "るびぃ"
euc2 = "はっかー"
# 「はっかー」を結合した新しい文字列を返す。
euc1 + euc2  # => "るびぃはっかー"
# 「はっかー」を破壊的に結合する。
euc1 << euc2 # => "るびぃはっかー"
euc1         # => "るびぃはっかー"

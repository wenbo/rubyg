# -*- coding: euc-jp -*-
euc1 = "るびぃ"
euc2 = "はっかー"
# エンコーディングが同じ場合は無事に結合できる。
euc1 + euc2     # => "るびぃはっかー"
# euc2をShift_JISに変換する。
sjis = euc2.encode("Shift_JIS")
# エンコーディングが異なる場合は結合できない。
(euc1 + sjis) rescue $!
# => #<Encoding::CompatibilityError: incompatible character encodings: EUC-JP and Shift_JIS>
# ASCII文字からなる文字列はエンコーディングが異なっていても結合できる。
ascii = "!!".force_encoding("UTF-8")
ascii.encoding  # => #<Encoding:UTF-8>
euc1 + ascii    # => "るびぃ!!"

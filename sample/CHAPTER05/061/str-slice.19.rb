# -*- coding: euc-jp -*-
euc = "わかめごはん"
#　インデックス0から3文字を取り除き、取り除いた文字列を返す。
euc2 = euc.dup; euc2.slice!(0,3)  # => "わかめ"
#　インデックス0から3文字が取り除かれる。
euc2                              # => "ごはん"
# インデックス3〜6を取り除く。
euc3 = euc.dup; euc3.slice!(3..6) # => "ごはん"
euc3                              # => "わかめ"
# euc4〜euc6はRuby 1.8と同じ。
# Shift_JIS文字列を作る。
sjis = "わかめ".encode("Shift_JIS")
# エンコーディングが異なるのでエラーになる。
euc.dup.tap {|euc7| euc7.slice(sjis)} rescue $!
# => #<Encoding::CompatibilityError: incompatible character encodings: EUC-JP and Shift_JIS>

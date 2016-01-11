# -*- coding: euc-jp -*-
euc = "東京都中央区"
# <%=idx "0〜3" %>を「大阪市」に書き換える。
euc2 = euc.dup; euc2[0,3] = "大阪市"; euc2  # => "大阪市中央区"
# <%=idx "3〜6" %>を「三鷹市」に書き換える。((:Object#tap:))を使うと簡潔に書ける。
euc.dup.tap {|euc3| euc3[3..6] = "三鷹市"}  # => "東京都三鷹市"
# euc4〜euc6はRuby 1.8と同様。

# Shift_JIS文字列を作る。
sjis = "ですよ。".encode("Shift_JIS")
# Shift_JIS文字列に置き換えようとするとエンコーディングが違うのでエラーになる。
euc.dup.tap {|euc7| euc7[3..6] = sjis} rescue $!
# => #<Encoding::CompatibilityError: incompatible character encodings: EUC-JP and Shift_JIS>

# -*- coding: euc-jp -*-
# Shift_JIS文字列を作成する。
sjis = "エンコーディング".encode "Shift_JIS"
# エンコーディングが異なるのでエラーになる。
"#{sjis}エラー" rescue $!
# => #<Encoding::CompatibilityError: incompatible character encodings: Shift_JIS and EUC-JP>

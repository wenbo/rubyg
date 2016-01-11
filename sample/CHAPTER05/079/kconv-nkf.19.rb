# -*- coding: euc-jp -*-
require 'kconv'
euc = "ありがとう、NKF。"
# String#encodeでJISに変換する。ただし、エンコーディング名はiso-2022-jp（大文字でも可）とする必要がある。
jis = euc.encode "iso-2022-jp"
jis.encoding   # => #<Encoding:ISO-2022-JP (dummy)>
# 自分自身のエンコーディングを変えるにはString#encode!を使う。
sjis = euc.dup.encode! "Shift_JIS"
sjis.encoding  # => #<Encoding:Shift_JIS>
# NKFやKconvで変換した場合はエンコーディングも変更してくれる。
utf8 = NKF.nkf("-Ew", euc)
utf8.encoding  # => #<Encoding:UTF-8>

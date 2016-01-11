# -*- coding: euc-jp -*-
require 'kconv'
euc = "Ruby 1.9ならば簡単！"
sjis = euc.encode "Shift_JIS"
utf8 = euc.encode "UTF-8"
# 推測すると、結果がEncodingで返ってくる。
Kconv.guess(euc)      # => #<Encoding:EUC-JP>
Kconv.guess(sjis)     # => #<Encoding:Shift_JIS>
Kconv.guess(utf8)     # => #<Encoding:UTF-8>
Kconv.guess("ascii")  # => #<Encoding:US-ASCII>
# NKF.guessも使える。
NKF.guess(utf8)       # => #<Encoding:UTF-8>
# EUC-JPのバイト列に対し、エンコーディングを騙す例
lie = euc.dup.force_encoding "Shift_JIS"
# あくまでバイト列で推測する。
Kconv.guess(lie)      # => #<Encoding:EUC-JP>
# 推測するだけなので文字列のエンコーディングは変わらない。
lie.encoding          # => #<Encoding:Shift_JIS>
# エンコーディング推測結果を文字列エンコーディングに設定する。
lie.force_encoding Kconv.guess(lie)
lie.encoding          # => #<Encoding:EUC-JP>

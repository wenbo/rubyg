# -*- coding: euc-jp -*-
# dumpしてもエンコーディングは保存される。
"こんにちは".dump            # => "\"\\xA4\\xB3\\xA4\\xF3\\xA4\\xCB\\xA4\\xC1\\xA4\\xCF\""
"こんにちは".dump.encoding   # => #<Encoding:EUC-JP>
# 「eval(string.dump) == string」が成立する。
eval("code\n".dump) == "code\n"           # => true
eval("こんにちは".dump) == "こんにちは"   # => true
# ASCII互換ではないエンコーディングの場合でもRubyの式として展開される。
"ab".encode("UTF-16LE").dump   # => "\"a\\x00b\\x00\".force_encoding(\"UTF-16LE\")"
# String#inspectは日本語文字列をバックスラッシュ記法に置き換えない。
puts "'おは'".inspect
# >> "'おは'"

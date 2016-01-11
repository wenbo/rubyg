# -*- coding: euc-jp -*-
s = "新機能"
s.encoding               # => #<Encoding:EUC-JP>
s.encode "Shift_JIS"     # Shift_JISに変換
s.encode "Windows-31J"   # Windows-31Jに変換
s.encode "UTF-8"         # UTF-8に変換
s.encode "iso-2022-jp"   # ISO-2022-JPに変換
# EUC-JPはASCII文字のみでは表現できないのでエラー
s.encode "US-ASCII" rescue $!
# => #<Encoding::UndefinedConversionError: "\xE6\x96\xB0" from UTF-8 to US-ASCII>
s.encode! "ISO-2022-JP"  # 破壊的に変換
s.encoding               # => #<Encoding:ISO-2022-JP (dummy)>

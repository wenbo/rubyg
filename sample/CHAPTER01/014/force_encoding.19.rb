# -*- coding: euc-jp -*-
ai = "あい"
ai.encoding                                 # => #<Encoding:EUC-JP>
ai.valid_encoding?                          # => true
# バイナリとして扱う
ai.force_encoding "ASCII-8BIT"              # => "\xA4\xA2\xA4\xA4"
ai.encoding                                 # => #<Encoding:ASCII-8BIT>
ai.valid_encoding?                          # => true
# 虚偽のエンコーディングを指定する（危険）
ai.force_encoding "UTF-8"
ai.valid_encoding?                          # => false
# バイナリ文字列からエンコーディングを設定する
"\xA4\xA2\xA4\xA4".force_encoding "EUC-JP"  # => "あい"

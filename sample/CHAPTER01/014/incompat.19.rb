# -*- coding: euc-jp -*-
euc  = "あ"
sjis = "い".encode "Shift_JIS"
euc + sjis rescue $!
# => #<Encoding::CompatibilityError: incompatible character encodings: EUC-JP and Shift_JIS>
# エンコーディングを揃える
euc + sjis.encode("EUC-JP")      # => "あい"
euc + sjis.encode(euc.encoding)  # => "あい"
euc + sjis.encode(__ENCODING__)  # => "あい"
